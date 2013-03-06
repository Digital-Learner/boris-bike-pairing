class Bike
  attr_reader :location

# status values: key value pairs
#               [status => "healthy"(true), "broken"(false) ] 
#               [available =>"utilised", "available"(true)]

#               ["location" => "station", "garage", "van", "unknown"]

#               ["location" => Station(n), not_in_station=false]
#                  if not_in_station == garage do x
#                   elsif not_in_station == van do y


  def initialize(available, broken = false, location = nil)
    @broken, @available, @location  = broken, available, location
    @broken ||= rand(5).zero?
    # if location is nil, check stations, if they have spare room assign location to it 
  end

  def broken?
    @broken
  end

  def fix!
    @broken = false
  end
  
end