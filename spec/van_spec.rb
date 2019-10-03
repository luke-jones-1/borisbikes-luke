require 'borisbikes'


describe Van do


  it 'collect all broken bikes from docking stations' do
    bike = Bike.new(true)
    docking_station = DockingStation.new
    docking_station.dock(bike)
    subject.collect_broken(docking_station)
    expect(subject.van).to include(bike)
  end

  it 'delivers them to garages' do
    bike = Bike.new(true)
    docking_station = DockingStation.new
    garage = Garage.new
    docking_station.dock(bike)
    subject.collect_broken(docking_station)
    subject.deliver(garage)
    expect(subject.van).to eq([])
    expect(garage.stored).to include(bike)
  end

  it 'can collect working bikes from garages' do
    bike = Bike.new(true)
    docking_station = DockingStation.new
    garage = Garage.new
    docking_station.dock(bike)
    subject.collect_broken(docking_station)
    subject.deliver(garage)
    subject.collect_working(garage)
    expect(subject.van).to include(bike.report_working)
  end

  it 'can distribute them to dockingstaions' do
    bike = Bike.new(true)
    docking_station = DockingStation.new
    garage = Garage.new
    docking_station.dock(bike)
    subject.collect_broken(docking_station)
    subject.deliver(garage)
    subject.collect_working(garage)
    subject.distribute(docking_station)
    expect(subject.van).to eq([])
    expect(docking_station.list_of_bikes).to include(bike)
  end

end
