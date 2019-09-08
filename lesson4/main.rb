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
puts "*  8) add_cargo_car 'id поезда' 'id вагона' - прицепить вагон к гр. поезду                        *"
puts "*  9) add_passenger_car 'id поезда' 'id вагона' - прицепить вагон к пасс. поезду                  *"
puts "*  10) delete_cargo_car 'id поезда' 'id вагона' - отцепить вагон от гр. поезда                    *"
puts "*  11) delete_passenger_car 'id поезда' 'id вагона' - отцепить вагон к пасс. поезда               *"
puts "*  12) go_forward 'id поезда' - переместить поезд вперёд (если маршрут установлен)                *"
puts "*  13) go_back 'id поезда' - переместить поезд назад (если маршрут установлен)                    *"
puts "*  14) print_stations 'id маршрута' - вывести список станций на экран                             *"
puts "*  15) print_trains 'id станции' - вывести список поездов на экран                                *"
puts '*                                                                                                 *'
puts '***************************************************************************************************'
puts ''

data = {}

loop do
  query = gets.chomp.split(' ')
  break if query[0] == 'stop'

  case query[0]
  when 'create_station'
    data[query[1]] = Station.new(query[2])

  when 'create_gargo_train'
    data[query[1]] = CargoTrain.new(query[2])

  when 'create_passenger_train'
    data[query[1]] = PassengerTrain.new(query[2])

  when 'create_route'
    data[query[1]] = Route.new(query[2], query[3])

  when 'delete_station'
    data[query[1]].delete_station(query[2])

  when 'add_station'
    data[query[1]].add_station(query[2])

  when 'set_route'
    data[query[1]].take_route(query[2])

  when 'add_cargo_car'
    contr.add_cargo_car(query[1], query[2])

  when 'add_station'
    contr.add_station(query[1], query[2])

  when 'add_station'
    contr.add_station(query[1], query[2])

  when 'add_station'
    contr.add_station(query[1], query[2])

  when 'add_station'
    contr.add_station(query[1], query[2])

  when 'add_station'
    contr.add_station(query[1], query[2])

  when 'add_station'
    contr.add_station(query[1], query[2])

  when 'add_station'
    contr.add_station(query[1], query[2])
  end

end

puts contr.data
