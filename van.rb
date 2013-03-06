class Van

  attr_reader :loaded_bikes

  def initialize(name, capacity = 15)
    @name, @capacity = name, capacity
    @loaded_bikes = []
  end

  def collect_bikes(location, no_to_collect)
    puts "Request to collect #{no_to_collect} bikes from #{location.name}"
    # TODO:
    # Okay, so we think we could use a module to do the release_bike method
    # so that it could be reused for delivering bikes to/from stations/garages
    no_to_collect.times { @loaded_bikes << location.release_bike(true) }
  end

  def deliver_bikes(location, no_to_deliver, direction)
    puts "Delivering #{no_to_deliver} bikes to #{location.name}"
    if direction == :to_be_fixed 
     no_to_deliver.times { location.bikes_to_be_fixed << @loaded_bikes.pop } 
    else
     no_to_deliver.times { location.bikes << @loaded_bikes.pop }
    end
  end
end
