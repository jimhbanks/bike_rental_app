require_relative '../lib/van.rb'

describe Van do

  let(:station) { DockingStation.new }
  let(:bike) { Bike.new }
  let(:van) { Van.new(:capacity => 10) }

  it 'van should be able to pick up' do
    station.dock(bike)
    van.pick_up_bike(bike)
    expect(van.bike_count).to eq 1
  end

  it "van should be able to drop off a bike" do
    station.dock(bike)
    van.pick_up_bike(bike)
    van.drop_off_bike(bike)
    expect(van.bike_count).to eq 0
  end

  it "van should know when it is full" do
    expect(van.full?).to be false
    10.times { van.pick_up_bike(Bike.new) }
    expect(van.full?).to be true
  end

  it "van should not accept a bike if it is full" do
    10.times { van.pick_up_bike(Bike.new) }
    expect { van.pick_up_bike(bike) }.to raise_error RuntimeError
  end

  it "van should provide the list of working bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    van.pick_up_bike(working_bike)
    van.pick_up_bike(broken_bike)
    expect(van.working_bikes).to eq([working_bike])
  end

  it "van should provide the list of broken bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    van.pick_up_bike(working_bike)
    van.pick_up_bike(broken_bike)
    expect(van.broken_bikes).to eq([broken_bike])
  end

end

