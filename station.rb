require './bike'

class Station

  attr_reader :bikes_in_station

  def initialize(name, capacity = 5)
    @name, @capacity = name, capacity
  end

  def receive_bike(bike)
    bike.location.nil? ? location == self.name : nil
  end

end


