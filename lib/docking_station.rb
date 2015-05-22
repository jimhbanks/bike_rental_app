  
class DockingStation
  DEFAULT_CAPACITY = 10 

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def dock bike
    @bikes << bike
  end

  def release(bike)
    raise 'humptydumpty'
    @bikes.delete(bike)
  end

  def full?
    bike_count == @capacity
  end
  
  def dock(bike)
  raise "Station is full" if full?
    @bikes << bike
  end

end