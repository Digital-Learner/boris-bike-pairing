class Van

  attr_reader :loaded_bikes

  def initialize(name, capacity = 15)
    @name, @capacity = name, capacity
    @loaded_bikes = []
  end

  def collect_bikes(location, no_to_collect)
    puts "Request to collect #{no_to_collect} bikes from #{location.name}"
    no_to_collect.times { @loaded_bikes << location.release_bike(true) }
    puts @loaded_bikes
  end

  def deliver_bikes(location, no_to_deliver)
    puts "Delivering #{no_to_deliver} bikes to #{location.name}"
    no_to_deliver.times { location.bikes_to_be_fixed << @loaded_bikes.pop }
    puts @loaded_bikes.count
    puts location.bikes_to_be_fixed.count
  end
end