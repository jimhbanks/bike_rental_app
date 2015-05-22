require_relative '../lib/bike.rb'

# we are describing the functionality of a SPECIFIC class (bike)
describe Bike do

let(:bike) { Bike.new } 
# above adds bike.new to every instance which refs BIKE
# this is a specific feature or behaviour
# that we expect to have

  it "should not be broken when created" do
    expect(bike.broken?).to be false

  end

  it "should be able to break" do
    bike.break
    expect(bike.broken?).to be true
  end

  it "Should be able to be fixed" do
    bike.break
    bike.fix
    expect(bike.broken?).to be false
  end


end