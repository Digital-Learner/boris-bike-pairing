class Bike
  attr_reader :location, :status

# status values: key value pairs
#               [status => "healthy"(true), "broken"(false) ] 
#               [available =>"utilised", "available"(true)]

#               ["location" => "station", "garage", "van", "unknown"]

#               ["location" => Station(n), not_in_station=false]
#                  if not_in_station == garage do x
#                   elsif not_in_station == van do y


  def initialize(available, status = nil, location = nil)
    @status, @available, @location  = status, available, location
    @status ||= rand(10).zero?
    # if location is nil, check stations, if they have spare room assign location to it 
  end

  def set_status
    if @status == true
     @status = !rand(10).zero?
    end
  end

  def bike_broken?(bike)
    if bike.status == true
      return true
    else 
      return false
    end
  end  
end