class Garage

  attr_reader :name, :ready_for_collection
  attr_accessor :bikes_to_be_fixed

  def initialize(name, capacity = 3)
    @capacity, @name = capacity, name
    @bikes_to_be_fixed = []
    @ready_for_collection = []
    @total_bikes = 0
  end

  def fix_bikes
    puts @bikes_to_be_fixed.count
    @bikes_to_be_fixed.each do |bike| 
      puts "#{bike.inspect}"
      bike.fix!
      puts "#{bike.inspect}"
      @ready_for_collection << bike
      total_bikes
    end
    @bikes_to_be_fixed = []
  end

  def total_bikes
    @total_bikes = @bikes_to_be_fixed.count + @ready_for_collection.count
  end
end