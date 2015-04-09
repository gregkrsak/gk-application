#!/usr/bin/env ruby

require 'gk-application'


my_app = GK::Application.new


my_app.on_starting = proc {
  puts 'Starting.'
  my_app.state = :running
}

my_app.on_running = proc {
  puts 'Running.'
  my_app.state = :stopping
}

my_app.on_stopping = proc {
  puts 'Stopping.'
  my_app.state = :stopped
}

my_app.on_stopped = proc {
  puts 'Stopped.'
}


my_app.state = :starting
