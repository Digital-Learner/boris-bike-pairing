#!/usr/bin/env ruby

# Gems
require 'active_support/inflector'

# local program files
require './bike'
require './people'
require './station'
require './garage'
require './van'

class Control

  def initialize
    @bikes, @people, @stations, @garages, @vans = [], [], [], [], []
  end

  def initialize_scenario
    puts "Initializing your system"
    make_bikes(5)
    make_people(5)
    make_stations(1)
    make_garages(1)
    make_vans(1)
    puts "There are #{@bikes.count} #{"bike".pluralize(@bikes.count)}, " +
                    "#{@people.count} #{"person".pluralize(@people.count)}, " +
                    "#{@stations.count} #{"station".pluralize(@stations.count)}, " + 
                    "#{@vans.count} #{"van".pluralize(@vans.count)} " + 
                    "and #{@garages.count} #{"garage".pluralize(@garages.count)} in your system at startup"    
  end

  def make_bikes(no)
    no.times do |i| 
      @bikes << Bike.new("healthy")
    end
  end

  def make_people(no) 
    no.times do |i| 
      @people << Person.new
    end
  end  

  def make_stations(no) 
    no.times do |i| 
      @stations << Station.new("Station number #{i}")
    end
  end 

  def make_garages(no) 
    no.times do |i| 
      @garages << Garage.new(4)
    end
  end

  def make_vans(no)
    no.times do |i| 
      @vans << Van.new("Van number #{i}")
    end
  end

  def create_report
    puts "Generating report"   
  end 
end



control = Control.new

control.initialize_scenario
control.create_report
