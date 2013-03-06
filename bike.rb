class Bike
  attr_reader :location

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