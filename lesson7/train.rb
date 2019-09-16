require_relative 'company'

class Train
  include Company

  attr_reader :name, :cars, :speed, :station_index

  def initialize(name)
    @name = name
    validate_name!
    @speed = 0
    @cars = []
  end

  def self.find(name)
    res = ObjectSpace.each_object(self).to_a.select do |train|
      train.name == name
    end

    res[0]
  end

  def name_format
    /[а-яa-z0-9]{3}-*[а-яa-z0-9]{2}/i
  end

  def validate_name!
    raise 'Неверный формат номера' if name !~ name_format

    true
  end

  def valid?
    validate_name!
  rescue StandardError
    false
  end

  def each_car
    cars.each do |car|
      yield(car)
    end
  end

  def brake
    @speed = 0
  end

  def speed_up(num)
    @speed += num.abs
  end

  def hook(car, type = nil)
    if @speed.zero? && car.class == type || type.nil?
      @cars << car
    end
  end

  def unhook(car)
    if @speed.zero?
      @cars.delete(car)
    end
  end

  def take_route(route)
    @route = route
    @station_index = 0
    route.stations[0].take_train(self)
  end

  def move(direction)
    current_station.send_train(self)
    forward if direction == :forward
    back if direction == :back
    current_station.take_train(self)
  end

  def current_station
    @route.stations[@station_index]
  end

  def next_station
    if current_station != @route.stations.last
      @route.stations[@station_index + 1]
    end
  end

  def prev_station
    if current_station != @route.stations.first
      @route.stations[@station_index - 1]
    end
  end

  # нужны только для работы внутреннего метода move
  private

  def forward
    @station_index += 1 if @route.stations.last != current_station
  end

  def back
    @station_index -= 1 if @route.stations.first != current_station
  end
end