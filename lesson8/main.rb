require_relative 'app'

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

app = App.new

begin
  loop do
    query = gets.chomp.split(' ')
    break if query[0] == 'exit'

    if query.size < 2
      puts 'Ошибка: Как минимум дожна быть команда и один параметр'
      next
    end

    command = query[0].to_sym

    app.send(command, query[1]) if query.size == 2
    app.send(command, query[1], query[2]) if query.size == 3
    app.send(command, query[1], query[2], query[3]) if query.size == 4
  end
rescue StandardError
  puts 'Ошибка: неверные параметры'
  retry
end
