#!/usr/bin/env ruby
system("clear")
# Perform calculations to generate header section
border_top_bottom = 0
program_label = "Pragram-name: "
program_name = $0.length
prog_header = (program_label.length + program_name + 4)
prog_head_blank = (program_label.length + program_name + 2)

@debug = ARGV[0]

# puts "debug set: #{debug}"


# now print the program header
prog_header.times { print "="}
print "\n|"
prog_head_blank.times { print " "}
print "|"
print "\n| #{program_label}#{$0} |\n|"
prog_head_blank.times { print " "}
print "|\n"
prog_header.times { print "="}
print "\n\n"

# Gems
require 'active_support/inflector'
require 'debugger'

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

  # def debug?
  #   @@debug == "-d"
  # end  

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
      bike = Bike.new(true)
      station = @stations[0]
      station.receive_bike(bike)
      @bikes << bike
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
      @garages << Garage.new("Garage number #{i}", 4)
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
    bikes_broken
    bikes_in_garage
    restock_station
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

  def bikes_broken
    puts "Report: Bikes Broken"
    # Refactor to add method to print messages when debug level is set
    puts "Broken Bikes Count: " + @stations[0].broken_bikes_count.to_s
    puts "Station Capacity: " + @stations[0].capacity.to_s
    puts "Station Capacity / Station::BROKEN_UPPER_LIMIT: " + (@stations[0].capacity / Station::BROKEN_UPPER_LIMIT).to_s
    @stations[0].broken_bikes_count > @stations[0].capacity / Station::BROKEN_UPPER_LIMIT ? collect_and_deliver : nil
  end

  def collect_and_deliver()
    @vans[0].collect_bikes(@stations[0], @stations[0].broken_bikes_count)
    puts "Collection completed, Delivery to Garage commencing"
    puts "#{@vans[0].inspect}"
    @vans[0].deliver_bikes(@garages[0], @vans[0].loaded_bikes.count, :to_be_fixed)
  end

  def bikes_in_garage
    puts "Report: Bikes in Garage"

    total = @garages.first.total_bikes
    to_fix = @garages.first.bikes_to_be_fixed.count
    to_collect = @garages.first.ready_for_collection.count
    puts "Garage: #{@garages[0].name} has #{total} bikes (To be fixed [#{to_fix}], Awaiting collection [#{to_collect}])"
    @garages[0].fix_bikes
    total2 = @garages.first.total_bikes
    to_fix2 = @garages.first.bikes_to_be_fixed.count
    to_collect2 = @garages.first.ready_for_collection.count
    puts "Garage: #{@garages[0].name} has #{total2} bikes (To be fixed [#{to_fix2}], Awaiting collection [#{to_collect2}])"
  end

  def restock_station
    # This can be refactored to use Control#collect_and_deliver (later!)
    @vans[0].collect_bikes(@garages[0], @garages[0].ready_for_collection.count) if @garages[0].ready_for_collection.count > 0
    @vans[0].deliver_bikes(@stations[0], @vans[0].loaded_bikes.count, nil)
    puts "There are now #{@stations[0].bikes_in_station.count} bikes at station: #{@stations[0].name}"
  end
end

# Start of main program execution
control = Control.new

control.initialize_scenario
control.create_report


