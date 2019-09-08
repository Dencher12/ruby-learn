require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'

require_relative 'cargo_car'
require_relative 'passenger_car'

class Controls
  attr_reader :data

  def initialize
    @data = {}
  end

  def create_station(station, name)
    data[station.to_sym] = Station.new(name)
  end

  def create_cargo_train(train, name)
    data[train.to_sym] = CargoTrain.new(name)
  end

  def create_passenger_train(train, name)
    data[train.to_sym] = PassengerTrain.new(name)
  end

  def create_route(route, station1, station2)
    data[route.to_sym] = Route.new(station1, station2)
  end
end
