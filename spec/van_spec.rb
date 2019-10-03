require 'borisbikes'


describe Van do

  let(:bike) {double :bike, :broken? => true, :report_working => true}
  let(:docking_station) {double :docking_station, :dock => bike, :broken_bikes_to_be_fixed => bike, :list_of_bikes => bike}
  let(:garage) {double :garage, :store => nil, :release => bike}

  it 'collect all broken bikes from docking stations' do
    docking_station.dock(bike)
    subject.collect_broken(docking_station)
    expect(subject.van).to include(bike)
  end

  it 'delivers them to garages' do
    docking_station.dock(bike)
    subject.collect_broken(docking_station)
    subject.deliver(garage)
    expect(subject.van).to eq([])
  end

  it 'can collect working bikes from garages' do
    docking_station.dock(bike)
    subject.collect_broken(docking_station)
    subject.deliver(garage)
    subject.collect_working(garage)
    expect(subject.van).to include(bike)
  end

  it 'can distribute them to dockingstaions' do
    docking_station.dock(bike)
    subject.collect_broken(docking_station)
    subject.deliver(garage)
    subject.collect_working(garage)
    subject.distribute(docking_station)
    expect(subject.van).to eq([])
    # expect(docking_station.list_of_bikes).to include(bike)
  end

end
