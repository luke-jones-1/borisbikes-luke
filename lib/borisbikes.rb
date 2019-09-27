

class DockingStation
  attr_reader :bikes, :capacity

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    if bikes.count > 0
      bikes.slice(0)
      bikes.delete_at(0)
    else
      fail
    end
  end

  def add_bike(bike)
    if bikes.full?
      bikes << bike
    else
      fail
    end
  end

  def list_of_bikes()
    bikes
  end

  def full?
    return false if self == nil
    self.count == capacity ? true : false
  end

end

class Bike
  def initialize
  end

  def working?
    return true
  end
end

docking_station = DockingStation.new
# bike = docking_station.release_bike
# docking_station.release_bike
# p docking_station.list_of_bikes
# p bike
# docking_station.add_bike(bike)
# p docking_station.list_of_bikes
# 20.times {docking_station.add_bike(Bike.new)}
# puts docking_station.list_of_bikes
# docking_station.add_bike(Bike.new)
