require './bike'

class Station

  attr_reader :name, :capacity
  BROKEN_UPPER_LIMIT = 2 # allow max limit of 50%


  def initialize(name, capacity = 5)
    @name, @capacity = name, capacity
    @bikes_in_station = []
    @broken_bikes_count = 0
  end

  def bikes_count
    @bikes_in_station.count
  end

  def broken_bikes_count
    @bikes_in_station.count{|bike| bike.broken? }
  end

  def receive_bike(bike)
    if @capacity > bikes_count
      bike.location.nil? ? bike.location == self.name : nil
      @bikes_in_station << bike
    else
      raise "Station full"
    end
  end
end
