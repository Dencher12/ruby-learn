require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_car'
require_relative 'passenger_car'

class App
  attr_reader :data

  def initialize
    @data = {}
  end

  def create_station(station_id, name)
    data[station_id] = Station.new(name)
  rescue StandardError
    puts 'Неверный формат имени, введите другое имя:'
    name = gets.chomp
    retry
  end

  def create_cargo_train(train_id, name)
    data[train_id] = CargoTrain.new(name)
  rescue StandardError
    puts 'Неверный формат имени, введите другое имя:'
    name = gets.chomp
    retry
  end

  def create_passenger_train(train_id, name)
    data[train_id] = PassengerTrain.new(name)
  rescue StandardError
    puts 'Неверный формат имени, введите другое имя:'
    name = gets.chomp
    retry
  end

  def create_route(route_id, station1_id, station2_id)
    data[route_id] = Route.new(data[station1_id], data[station2_id])
  end

  def delete_station(route_id, station_id)
    data[route_id].delete_station(data[station_id])
  end

  def add_station(route_id, station_id)
    data[route_id].add_station(data[station_id])
  end

  def set_route(train_id, route_id)
    data[train_id].take_route(data[route_id])
  end

  def add_car(train_id, car_id)
    data[train_id].hook(data[car_id])
  end

  def delete_car(train_id, car_id)
    data[train_id].unhook(data[car_id])
  end

  def go_forward(train_id)
    data[train_id].move(:forward)
  end

  def go_back(train_id)
    data[train_id].move(:back)
  end

  def print_stations(route_id)
    data[route_id].stations.each do |station|
      puts station.name
    end
  end

  def print_trains(station_id)
    data[station_id].each_train do |train|
      puts "##{train.name}  #{train.class}  кол-во вагонов: #{train.cars.size}"
    end
  end

  def print_cars(train_id)
    train = data[train_id]
    car_number = 0

    train.each_car do |car|
      car_number += 1

      if train.class == PassengerTrain
        puts "##{car_number}  #{car.class}  мест свободно: #{car.free_places} , мест занято: #{car.reserved_places}"
      else
        puts "##{car_number}  #{car.class}  свободный объём: #{car.free_volume}, занятый объём: #{car.reserved_volume}"
      end
    end
  end

  def reserve_place(train_id)
    data[train_id].reserve_place
  end

  def reserve_volume(train_id, volume)
    data[train_id].reserve_volume(volume)
  end

  def create_cargo_car(car_id, max_volume)
    data[car_id] = CargoCar.new(max_volume)
  end

  def create_passenger_car(car_id, max_places)
    data[car_id] = PassengerCar.new(max_places)
  end
end
