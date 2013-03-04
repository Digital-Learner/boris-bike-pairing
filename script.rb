require './bike'

class Control

  def initialize
    @bikes = []
  end

  def initialize_scenario
    make_bikes(5)
    puts @bikes
  end

  def make_bikes(no) 
    no.times do |i| 
      @bikes << Bike.new("healthy")
    end
  end
end



control = Control.new

control.initialize_scenario
