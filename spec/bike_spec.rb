require 'borisbikes'


describe Bike do

it 'checks if bike is working' do
bike = Bike.new
expect(bike).to respond_to(:working?)
end

end
