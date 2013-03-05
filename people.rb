class Person
  def initialize(bike = false)
    @bike = bike
  end

  # person hires bike
  # person rides bike
  # person return bike

  def hire_bike(station)
    puts "Hiring bike"
    @bike = station.release_bike(false)
    puts "I hired #{@bike}"
  end

  def return_bike(station)
    station.receive_bike(@bike)
    puts "Dude(tte), I didn't STEAL/ABANDON or BREAK it!"
  end
end