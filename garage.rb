class Garage

  attr_reader :name 
  attr_accessor :bikes_to_be_fixed

  def initialize(name, capacity = 3)
    @capacity, @name = capacity, name
    @bikes_to_be_fixed = []
  end

#   def receive_bike(bike)
#     if @capacity > bikes_count
#       bike.location.nil? ? bike.location == self.name : nil
#       @bikes_in_station << bike
#     else
#       raise "Station full"
#     end
#   end

#   def release_bike(broken)
#     if broken == true
#       bike = @bikes_in_station.select{|bike| bike.broken?}.first
#       @bikes_in_station.delete(bike)
#       return bike
#     else 
#       unbroken_bike = @bikes_in_station.select{|bike| !bike.broken?}.first
#       @bikes_in_station.delete(unbroken) 
#       return unbroken_bike 
#     end
#   end
end