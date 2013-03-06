# require './bike'

class Station

  attr_reader :name, :capacity
  attr_reader :bikes
  BROKEN_UPPER_LIMIT = 20 # allow max limit of percentage (50% or 20%)

  def initialize(name, capacity = 5)
    @name, @capacity = name, capacity
    @bikes = []
  end

  # def bikes_count
  #   @bikes.count
  # end

  def broken_bikes # @stations.first.broken_bikes.count
    @bikes.select {|bike| bike.broken? }
  end

  def receive_bike(bike)
    raise "Station full" if full?
    # 1. get bike's location from the station, van or garage
    # don't violate the DRY principle
    # 2. it woulnd't work anyway because you used == instead of =
    # 3. if part of the ternary operator is nil, you don't need the ternary operator
    # bike.location.nil? ? bike.location == self.name : nil    
    @bikes << bike
  end

  def full?
    @capacity <=  @bikes.count
  end

  def release_bike(broken)
    if broken # don't need to use == here
      bike = @bikes.select{|bike| bike.broken?}.first
      @bikes.delete(bike)
      bike # don't have to use return here
    else
      unbroken_bike = @bikes.select{|bike| !bike.broken?}.first
      @bikes.delete(unbroken_bike) 
      unbroken_bike 
    end
  end
end
