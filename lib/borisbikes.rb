

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
    bikes << bike
  end

  def list_of_bikes()
    bikes
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
