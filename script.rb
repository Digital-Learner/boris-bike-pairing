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

# puts `bundle show active_support`

# Start of main program execution
Control.header
control = Control.new


control.create_report

while true
  control.run
  control.create_report
end

