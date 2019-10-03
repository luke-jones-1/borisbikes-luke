

class DockingStation
  attr_reader :bikes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    bike = bikes.pop
    fail 'Bike is broken' if bike.broken?
    bike
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  def list_of_bikes
    bikes
  end

  def broken_bikes_to_be_fixed
    broken_bikes = bikes
    broken_bikes.select { |bike| bike.broken? }
    return broken_bikes
    bikes - broken_bikes
    broken_bikes = []
  end

  private

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end



end

class Bike
  attr_accessor :broken

  def initialize(broken=false)
    @broken = broken
  end

  def working?
    working = !(broken?)
  end

  def broken?
    broken
  end

  def report_broken
    broken = true
  end

  def report_working
    @broken = false
    self
  end

end

class Garage

  attr_reader :stored

  def initialize(stored=[])
    @stored = stored
  end

  def store(van_bikes)
    stored << van_bikes
  end

  def repair
    stored.map { |bike| bike.report_working }
  end

  def release
    return repair
    stored = []
  end

end

class Van

  attr_reader :van

  def initialize
    @van = []
  end

  def collect_broken(docking_station)
    input = docking_station.broken_bikes_to_be_fixed
    input.each { |bike| @van << bike}
    van
    end

  def deliver(garage)
    van.each { |bike| garage.store(bike) }
    @van = []
  end

  def collect_working(garage)
    garage = garage.release
    garage.each { |bike| @van << bike }
  end

  def distribute(docking_station)
    van.each { |bike| docking_station.dock(bike) }
    @van = []
  end

  # def dock
  #
  # end

end
#bike = Bike.new(true)
#docking_station.dock(bike)
#docking_station.release_bike
# p docking_station.list_of_bikes
# p bike
# docking_station.dock(bike)
# p docking_station.list_of_bikes
# 20.times {docking_station.dock(Bike.new)}
# puts docking_station.list_of_bikes
# docking_station.dock(Bike.new)
# docking_station.full?
