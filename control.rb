class Control

  TOTAL_STATIONS = 2
  TOTAL_BIKES = 5
  TOTAL_PEOPLE = 5
  TOTAL_GARAGES = 1
  TOTAL_VANS = 1

  def initialize
    @bikes, @people, @stations, @garages, @vans = [], [], [], [], []
  end

  # def debug?
  #   @@debug == "-d"
  # end  

  def self.header
    system("clear")
    # Perform calculations to generate header section
    border_top_bottom = 0
    program_label = "Pragram-name: "
    program_name = $0.length
    prog_header = (program_label.length + program_name + 4)
    prog_head_blank = (program_label.length + program_name + 2)

    @debug = ARGV[0]
    # puts "debug set: #{debug}"

    # now print the program header
    prog_header.times { print "="}
    print "\n|"
    prog_head_blank.times { print " "}
    print "|"
    print "\n| #{program_label}#{$0} |\n|"
    prog_head_blank.times { print " "}
    print "|\n"
    prog_header.times { print "="}
    print "\n\n"
  end

  def initialize_scenario
    puts "Initializing your system"
    make_stations(TOTAL_STATIONS)
    make_bikes(TOTAL_BIKES)
    make_people(TOTAL_PEOPLE)
    make_garages(TOTAL_GARAGES)
    make_vans(TOTAL_VANS)

    puts "There are #{system_state(@bikes, "bike")}, " +
                    "#{system_state(@people, "person")}, " +
                    "#{system_state(@stations, "station")}, " + 
                    "#{system_state(@vans, "van")}" + 
                    " and #{system_state(@garages, "garage")} in your system at startup"
  end

  def system_state(object, string)
    "'#{object.count}' #{string.pluralize(object.count)}"
  end

  def make_bikes(no)
    no.times do |i| 
      @bikes << @stations[0].receive_bike(Bike.new(true))
    end
  end

  def make_people(no) 
    no.times do |i| 
      @people << Person.new
    end
  end  

  def make_stations(no) 
    no.times do |i| 
      @stations << Station.new("Station number #{i}")
    end
  end 

  def make_garages(no) 
    no.times do |i| 
      @garages << Garage.new("Garage number #{i}", 4)
    end
  end

  def make_vans(no)
    no.times do |i| 
      @vans << Van.new("Van number #{i}")
    end
  end

  # TODO:
  # We currently have concerns mixed typically with run and report intertwined.
  # Refactor
  def create_report
    puts "Generating report"
    bikes_in_circulation # total no. bikes created
    bikes
    bikes_broken
    bikes_in_garage
    restock_station
    bikes_being_ridden
  end

  def bikes_in_circulation
    puts "Report: Bikes in Circulation: '#{@bikes.count}'"
  end

  def bikes
    puts "Report: Bikes at Station(s)"
    @stations.each {|station| station.bikes.count.nil? ? (puts "There are 0 bikes at #{station.name}") : (puts "There are #{system_state(station.bikes, "bike")} at station '#{station.name}'")}
  end

  def bikes_broken
    puts "Report: Bikes Broken"
    # Refactor to add method to print messages when debug level is set
    @stations.each { |station| puts "Broken Bikes Count: " + station.broken_bikes.count.to_s } 
    @stations.each { |station| puts "#{station.name} Capacity: " + station.capacity.to_s }
    @stations.each { |station| station.broken_bikes.count > station.capacity / Station::BROKEN_UPPER_LIMIT ? collect_and_deliver : nil }
  end

  # TODO: collect(from, from_array, number)
  # TODO: deliver(to, to_array, number)
  # These are to refactor our collect_and_deliver and restock_station methods


  def collect_and_deliver()
    @vans[0].collect_bikes(@stations[0], @stations[0].broken_bikes.count)
    puts "Collection completed, Delivery to Garage commencing"
    puts "#{@vans[0].inspect}"
    @vans[0].deliver_bikes(@garages[0], @vans[0].loaded_bikes.count, :to_be_fixed)
  end

  def restock_station
    # This can be refactored to use Control#collect_and_deliver (later!)
    @vans[0].collect_bikes(@garages[0], @garages[0].ready_for_collection.count) if @garages[0].ready_for_collection.count > 0
    @vans[0].deliver_bikes(@stations[0], @vans[0].loaded_bikes.count, nil)
    puts "There are now #{@stations[0].bikes.count} bikes at station: #{@stations[0].name}"
  end

  def bikes_in_garage
    puts "Report: Bikes in Garage"

    total = @garages.first.total_bikes
    to_fix = @garages.first.bikes_to_be_fixed.count
    to_collect = @garages.first.ready_for_collection.count
    puts "Garage: #{@garages[0].name} has #{total} bikes (To be fixed [#{to_fix}], Awaiting collection [#{to_collect}])"
    @garages[0].fix_bikes
    total2 = @garages.first.total_bikes
    to_fix2 = @garages.first.bikes_to_be_fixed.count
    to_collect2 = @garages.first.ready_for_collection.count
    puts "Garage: #{@garages[0].name} has #{total2} bikes (To be fixed [#{to_fix2}], Awaiting collection [#{to_collect2}])"
  end

  def bikes_being_ridden
    rand(10).times do
      @people[0].hire_bike(@stations[0])
    end
    bikes_circulating_report
    @people[0].return_bike(@stations[0])
  end

  # Attempt to report on system status of bikes
  def bikes_circulating_report
    ridden = @stations[0].capacity - @stations[0].bikes.count
    broken = @stations[0].broken_bikes.count
    puts "Report: Bikes being Ridden\n===============\n"
    # %() ruby sexy heredoc replacement

    # regular heredoc
    @text = <<CIRCULATING_BIKES
There #{ridden == 1 ? "is" : "are" } #{ridden} #{"bike".pluralize(ridden)} out being ridden by 'no' of people

CIRCULATING_BIKES

    puts @text
  end
end