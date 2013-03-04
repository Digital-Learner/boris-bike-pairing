require './bike'
require './people'
require './station'

class Control

  def initialize
    @bikes, @people, @stations = [], [], []
  end

  def initialize_scenario
    make_bikes(5)
    puts @bikes
    make_people(5)
    puts @people
    make_stations(1)
    puts @stations
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
end



control = Control.new

control.initialize_scenario
