

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
    # @bikes << Bike.new
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
    if bikes.count < 1
      bikes << bike
    else
      fail
    end
  end

  def list_of_bikes()
    bikes
  end
end

class Bike
  def initialize
  end

  def working?
    return true
  end
end

# docking_station = DockingStation.new
# bike = docking_station.release_bike
# docking_station.release_bike
# # p docking_station.list_of_bikes
# # p bike
# # docking_station.add_bike(bike)
# # p docking_station.list_of_bikes
