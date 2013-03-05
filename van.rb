class Van

  def initialize(name, capacity = 15)
    @name, @capacity = name, capacity
  end

  def collect_bikes(location, no_to_collect)
    puts "Request to collect #{no_to_collect} bikes from #{location}"
  end
end