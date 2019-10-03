require 'borisbikes'



describe Garage do

  let (:bike) {double :bike, report_working: false }

  it 'recieve broken bikes from vans' do
    # bike = Bike.new(true)
    subject.store(bike)
    expect(subject.stored).to eq([bike])
  end

  it 'releases working bikes' do
    # bike = Bike.new(true)
    subject.store(bike)
    expect(subject.release).to include(bike.report_working)
    expect(subject.stored).to eq([])
  end

end
