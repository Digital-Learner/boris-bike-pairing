require './bike'

class Station

  attr_reader :name, :capacity
  attr_accessor :bikes_in_station
  BROKEN_UPPER_LIMIT = 20 # allow max limit of percentage (50% or 20%)

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

  def release_bike(broken)
    if broken == true
      bike = @bikes_in_station.select{|bike| bike.broken?}.first
      @bikes_in_station.delete(bike)
      return bike
    else
      unbroken_bike = @bikes_in_station.select{|bike| !bike.broken?}.first
      @bikes_in_station.delete(unbroken_bike) 
      return unbroken_bike 
    end
  end
end
