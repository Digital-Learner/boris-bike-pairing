class Bike
  attr_reader :location

# status values: key value pairs
#               [status => "healthy"(true), "broken"(false) ] 
#               [available =>"utilised", "available"(true)]

#               ["location" => "station", "garage", "van", "unknown"]

#               ["location" => Station(n), not_in_station=false]
#                  if not_in_station == garage do x
#                   elsif not_in_station == van do y


  def initialize(status, available, location = nil)
    @status, @available, @location  = status, available, location
  end
end