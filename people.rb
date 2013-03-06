class Person
  def initialize(bike = false)
    @bike = bike
  end

  # person hires bike
  # person rides bike
  # person return bike

  def hire_bike(station)
    @bike = station.release_bike(false)
  end

  def return_bike(station)
    station.receive_bike(@bike)
  end
end