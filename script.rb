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
    make_stations(1)
    make_bikes(5)
    make_people(5)
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
      bike = Bike.new(true, true)
      station = @stations[0]
      station.receive_bike(bike)
      @bikes << bike
    end
    #p self    
  end

  def make_people(no) 
    no.times do |i| 
      @people << Person.new
    end
#    p (self)
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
    bikes_in_circulation # total no. bikes created
    bikes_in_station
    # bikes_in_garage
    # bikes_broken
    # bikes_being_ridden
  end

  def bikes_in_circulation
    puts "Report: Bikes in Circulation #{@bikes.count}"
  end

  def bikes_in_station
    puts "Report: Bikes in Station"
    # puts @stations[0].bikes_count
    puts @stations[0].bikes_count.nil? ? "There are 0 bikes at this station" : "There are #{@stations[0].bikes_count} bikes in the station"
  end
end



control = Control.new

control.initialize_scenario
control.create_report


