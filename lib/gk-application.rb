# gk-application.rb
# GK::Application
#
# A simple framework for creating applications in Ruby
#
# Copyright 2014 Greg M. Krsak (greg.krsak@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'fileutils'


module GK

class Application

  # The name of this gem
  GEM_NAME = 'gk-application'
  # The name of the project template
  TEMPLATE_PROJECT = 'my_app.rb'
  # Custom exception messages
  MSG_INVALID_STATE = 'This application does not support the requested state.'

  # An Application instance's state may be one of
  # :starting
  # :running
  # :stopping
  # :stopped
  def state
    @state
  end
  def state=(new_state)
    case new_state
    when :starting
      @on_starting.call
    when :running
      @on_running.call
    when :stopping
      @on_stopping.call
    when :stopped
      @on_stopped.call
    else
      raise MSG_INVALID_STATE
    end
  end

  # State change event handlers
  attr_accessor :on_starting
  attr_accessor :on_running
  attr_accessor :on_stopping
  attr_accessor :on_stopped

  # This is run once every time an Application instance is created
  def initialize
    # Initialize event handlers
    @on_starting = proc {
      state = :running
    }
    @on_running = proc {
      state = :stopping
    }
    @on_stopping = proc {
      state = :stopped
    }
    @on_stopped = proc { }
    # Always create the Application instance in the stopped state
    state = :stopped
  end

  # This creates a new GK::Application project.
  # The new application will be called "my_app.rb" and be placed in the
  # current directory unless otherwise specified.
  def project(name: TEMPLATE_PROJECT)
    # Get the path for the gk-application gem
    spec = Gem::Specification.find_by_name(GEM_NAME)
    gem_root = spec.gem_dir
    source_file = File.join(gem_root, TEMPLATE_PROJECT);
    # Create the target folder if it doesn't exist
    target_dir = File.dirname(name)
    FileUtils.mkdir_p(target_dir)
    # Copy the my_app.rb file (in the gem directory) to the target
    target_file = File.join(target_dir, name)
    FileUtils.cp(source_file, target_file)
  end

end # Class

end # Module

# End of gk-application.rb
