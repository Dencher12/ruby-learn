require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'

require_relative 'cargo_car'
require_relative 'passenger_car'
require_relative 'controls'

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
puts "*  12) print_stations 'id маршрута' - вывести список станций на экран                             *"
puts "*  13) print_trains 'id станции' - вывести список поездов на экран                                *"
puts '*                                                                                                 *'
puts '***************************************************************************************************'
puts ''

data = {}

#TODO:
#реализовать 12 и 13 команды
#добавить возможность создания вагонов (ещё две команды)


loop do
  query = gets.chomp.split(' ')
  break if query[0] == 'stop'

  case query[0]
  when 'create_station'
    data[query[1]] = Station.new(query[2])

  when 'create_cargo_train'
    data[query[1]] = CargoTrain.new(query[2])

  when 'create_passenger_train'
    data[query[1]] = PassengerTrain.new(query[2])

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
  end

end

puts data
