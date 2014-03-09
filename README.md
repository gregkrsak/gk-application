Gem: gk-application
===================

A simple framework for creating applications in Ruby
----------------------------------------------------

An instance of ```GK::Application``` allows you to easily mange your Ruby application's state, with minimal fuss. Supported states are ```:starting```, ```:running```, ```:stopping``` and ```:stopped```.

Install with gem
----------------

Quick installation with ```gem```:

```bash
gem install gk-application
```

Get started with a new project
------------------------------

Need a project template? No problem:

```bash
ruby -e 'require "gk-application"' -e 'GK::Application.new.project'
```

Or using ```irb```:

```
$ irb
irb(main):001:0> require 'gk-application'
=> true
irb(main):002:0> GK::Application.new.project
=> nil
irb(main):003:0> quit
```

And you'll have a brand-new ```my_app.rb``` ready to go in the current folder!

Here's what an application looks like
-------------------------------------

```ruby
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

```
