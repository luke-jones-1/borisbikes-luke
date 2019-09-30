require 'borisbikes'


describe Bike do

it 'checks if bike is working' do
  bike = Bike.new
  expect(bike).to respond_to(:broken?)
end

it 'should return broken' do
  bike = Bike.new(true)
  status = bike.broken?
  expect(status).to eq(true)
end

end
