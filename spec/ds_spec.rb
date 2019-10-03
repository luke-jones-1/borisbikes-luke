require 'borisbikes'

describe DockingStation do

  let(:bike) { double :bike, report_broken: true, broken?: false }
  let(:van) {double :van, :collect_broken => nil, :distribute => bike}

  it 'releases bike from docking station' do
    docking_station = described_class.new(1)
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'releases a working bike' do
    subject.dock(bike)
    released_bike = subject.release_bike
    expect(released_bike).not_to be_broken
  end

  it 'takes a bike as arg, docks to instance var' do
    docking_station = described_class.new(5)
    docking_station.dock(bike)
    expect(docking_station.list_of_bikes).to include(bike)
  end

  it 'does not release bikes when none are available' do
    docking_station = described_class.new(0)
    expect { raise docking_station.release_bike}.to raise_error 'No bikes available'
  end

  it 'does not dock bikes when no spaces are available' do
    docking_station = described_class.new(5)
    docking_station.capacity.times {docking_station.dock(bike)}
    expect { raise docking_station.dock(bike)}.to raise_error 'Docking station full'
  end

  it 'returns twenty when not given capacity argument' do
    docking_station = described_class.new
    expect(docking_station.capacity).to eq(20)
  end

  it 'wont allow you to release a broken bike' do
    bike.report_broken
    subject.dock(bike)
    allow(bike).to receive(:broken?).and_return(true)
    expect { raise subject.release_bike }.to raise_error 'Bike is broken'
  end

  it 'recieves a working bike from van' do
    subject.dock(bike)
    van.collect_broken(subject)
    van.distribute(subject)
    expect(subject.list_of_bikes).to include(bike)
  end

end
