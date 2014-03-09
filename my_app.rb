#!/usr/bin/env ruby

require 'gk-application'


my_app = GK::Application.new


my_app.on_starting = Proc.new do
  puts 'Starting.'
  my_app.state = :running
end

my_app.on_running = Proc.new do
  puts 'Running.'
  my_app.state = :stopping
end

my_app.on_stopping = Proc.new do
  puts 'Stopping.'
  my_app.state = :stopped
end

my_app.on_stopped = Proc.new do
  puts 'Stopped.'
end


my_app.state = :starting
