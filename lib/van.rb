class Van
  DEFAULT_CAPACITY = 10

  attr_accessor :capacity, :bikes

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def bike_count
    @bikes.length
  end

  def pick_up_bike bike
    raise "Van is full" if full?
    @bikes << bike
  end

  def drop_off_bike bike
    @bikes.delete(bike)
  end

  def full?
    @capacity == bike_count
  end

  def working_bikes
    @bikes.reject { |bike| bike.broken? }
  end

  def broken_bikes
    @bikes.select { |bike| bike.broken? }
  end
end