require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_car'
require_relative 'passenger_car'

puts ''
puts '*********************************************КОМАНДЫ***********************************************'
puts '*                                                                                                 *'
puts "*  1) create_station 'id станции' 'имя' - создать станцию                                         *"
puts "*  2) create_cargo_train 'id поезда' 'имя' - создать грузовой поезд                               *"
puts "*  3) create_passenger_train 'id поезда' 'имя' - создать пассажирский поезд                       *"
puts "*  4) create_route 'id маршрута' 'id первой станции' 'id последней станции' - создать маршрут     *"
puts "*  5) delete_station 'id маршрута' 'id станции' - удалить станцию из  маршрута                    *"
puts "*  6) add_station 'id маршрута' 'id станции' - добавить станцию в маршрут                         *"
puts "*  7) set_route 'id поезда' 'id маршрута' - установить маршрут поезду                             *"
puts "*  8) add_car 'id поезда' 'id вагона' - прицепить вагон к поезду                                  *"
puts "*  9) delete_car 'id поезда' 'id вагона' - отцепить вагон от поезда                               *"
puts "*  10) go_forward 'id поезда' - переместить поезд вперёд (если маршрут установлен)                *"
puts "*  11) go_back 'id поезда' - переместить поезд назад (если маршрут установлен)                    *"
puts "*  12) reserve_place 'id вагона' - занять место в пасс. вагоне                                    *"
puts "*  13) reserve_volume 'id вагона' 'объём' - занять объём в гр. вагоне                             *"
puts "*  14) create_cargo_car 'id гр. вагона' 'объём' - создать грузовой вагон                          *"
puts "*  15) create_passenger_car 'id  пасс. вагона' 'ко-во мест' - создать пассажирский вагон          *"
puts "*  16) print_stations 'id маршрута' - вывести список станций на экран                             *"
puts "*  17) print_trains 'id станции' - вывести список поездов на экран                                *"
puts "*  18) print_cars 'id поезда' - вывести список вагонов на экран                                   *"
puts '*                                                                                                 *'
puts '***************************************************************************************************'
puts ''

data = {}

require 'pry'
binding.pry

begin
  loop do
    query = gets.chomp.split(' ')
    break if query[0] == 'stop'

    case query[0]

    when 'create_station'
      begin
        data[query[1]] = Station.new(query[2])
      rescue StandardError
        puts 'Неверный формат имени, введите другое имя:'
        query[2] = gets.chomp
        retry
      end

    when 'create_cargo_train'
      begin
        data[query[1]] = CargoTrain.new(query[2])
      rescue StandardError
        puts 'Неверный формат номера, введите другой номер:'
        query[2] = gets.chomp
        retry
      end

    when 'create_passenger_train'
      begin
        data[query[1]] = PassengerTrain.new(query[2])
      rescue StandardError
        puts 'Неверный формат номера, введите другой номер:'
        query[2] = gets.chomp
        retry
      end

    when 'create_route'
      data[query[1]] = Route.new(data[query[2]], data[query[3]])

    when 'delete_station'
      data[query[1]].delete_station(data[query[2]])

    when 'add_station'
      data[query[1]].add_station(data[query[2]])

    when 'set_route'
      data[query[1]].take_route(data[query[2]])

    when 'add_car'
      data[query[1]].hook(data[query[2]])

    when 'delete_car'
      data[query[1]].unhook(data[query[2]])

    when 'go_forward'
      data[query[1]].move(:forward)

    when 'go_back'
      data[query[1]].move(:back)

    when 'print_stations'
      data[query[1]].stations.each do |station|
        puts station.name
      end

    when 'print_trains'
      data[query[1]].each_train do |train|
        puts "№#{train.name}  #{train.class}  кол-во вагонов: #{train.cars.size}"
      end

    when 'print_cars'
      train = data[query[1]]
      car_number = 0

      train.each_car do |car|
        car_number += 1

        if train.class == PassengerTrain
          puts "№#{car_number}  #{car.class}  мест свободно: #{car.free_places} , мест занято: #{car.reserved_places}"
        else
          puts "№#{car_number}  #{car.class}  свободный объём: #{car.free_volume}, занятый объём: #{car.reserved_volume}"
        end
      end

    when 'reserve_place'
      data[query[1]].reserve_place

    when 'reserve_volume'
      data[query[1]].reserve_volume(query[2])

    when 'create_cargo_car'
      data[query[1]] = CargoCar.new(query[2])

    when 'create_passenger_car'
      data[query[1]] = PassengerCar.new(query[2])

    else puts 'Ошибка: команда не найдена'

    end
  end
rescue StandardError => e
  puts 'Ошибка: неверные параметры'
  puts e.message
  retry
end
