# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'gk-application'
  s.version     = '0.0.3'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Greg M. Krsak']
  s.email       = ['greg.krsak@gmail.com']
  s.homepage    = 'http://github.com/gregkrsak/gk-application'
  s.summary     = 'A simple framework for creating applications in Ruby'
  s.description = "An instance of GK::Application allows you to easily mange your Ruby application's state, with minimal fuss. Supported states are :starting, :running, :stopping and :stopped."
  s.license     = 'Apache-2'

  s.required_rubygems_version = '>= 2.0.0'

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md my_app.rb)
  s.require_path = 'lib'
end
