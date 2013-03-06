#!/usr/bin/env ruby
# Gems
require 'active_support/inflector'
require 'debugger'

# local program files
require './bike'
require './people'
require './station'
require './garage'
require './van'
require './control'


# Start of main program execution
Control.header
control = Control.new

control.initialize_scenario
control.create_report


