require 'borisbikes'

describe DockingStation do

let(:bike) { double :bike }

it 'releases bike from docking station' do
docking_station = DockingStation.new(1)
expect(docking_station).to respond_to(:release_bike)
end

it 'releases a working bike' do
  # docking_station = DockingStation.new(5)
  # docking_station.dock double(:bike, :release_bike => :bike)
  # bike = docking_station.release_bike
  # expect(bike.class).to eq(Bike)
  # expect(bike).not_to be_broken

  allow(bike).to receive(:broken?).and_return(false)
  subject.dock(bike)
  released_bike = subject.release_bike
  expect(released_bike).not_to be_broken
end

it 'takes a bike as arg, docks to instance var' do
  allow(bike).to receive(:broken?).and_return(false)
  docking_station = DockingStation.new(5)
  bike = double(:bike)
  docking_station.dock(bike)
  expect(docking_station.list_of_bikes).to include(bike)
end

it 'does not release bikes when none are available' do
  allow(bike).to receive(:broken?).and_return(false)
  docking_station = DockingStation.new(0)
  expect { raise docking_station.release_bike}.to raise_error 'No bikes available'
end

it 'does not dock bikes when no spaces are available' do
  allow(bike).to receive(:broken?).and_return(false)
  docking_station = DockingStation.new(5)
  bike = double(:bike)
  docking_station.capacity.times {docking_station.dock(double(:bike))}
  expect { raise docking_station.dock(bike)}.to raise_error 'Docking station full'
end

it 'returns twenty when not given capacity argument' do
  allow(bike).to receive(:broken?).and_return(false)
  docking_station = DockingStation.new
  expect(docking_station.capacity).to eq(20)
end

it 'wont allow you to release a broken bike' do
  bike.report_broken
  subject.dock(bike)
  allow(bike).to receive(:report_broken).and_return(true)
  expect { raise subject.release_bike }.to raise_error 'Bike is broken'
end

end
