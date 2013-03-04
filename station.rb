require './bike'

class Station

  attr_reader :name


  def initialize(name, capacity = 5)
    @name, @capacity = name, capacity
    @bikes_in_station = []
    @broken_bikes_count = 0
  end

  def bikes_count
    @bikes_in_station.count
  end

  def broken_bikes_count
    @bikes_in_station.each do |bike| 
      # p bike.inspect
      bike.bike_broken?(bike) ? ( @broken_bikes_count += 1 ) : @broken_bikes_count
    end
    return @broken_bikes_count
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
