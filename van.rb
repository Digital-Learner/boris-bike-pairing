class Van

  attr_reader :loaded_bikes

  def initialize(name, capacity = 15)
    @name, @capacity = name, capacity
    @loaded_bikes = []
  end

  def collect_bikes(station, no_to_collect)
    # broken_bikes = []
    puts "Request to collect #{no_to_collect} bikes from #{station.name}"
    
    # .each {|bike| bike.broken? ? broken_bikes << bike : next}

    # while no_to_collect < broken_bikes.count
      

    # end

    no_to_collect.times { @loaded_bikes << station.release_bike(true) }
    puts @loaded_bikes
  end

  # def load_bike(bike)
  #   @loaded_bikes << bike
  # end



end