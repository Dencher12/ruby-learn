class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    if train.type == 'cargo'
      puts "Грузовой поезд #{train.id} прибывает на станцию #{@name}"
    else
      puts "Пассажирский поезд #{train.id} прибывает на станцию #{@name}"
    end
    @trains << train
  end

  def send_train(train)
    if train.type == 'cargo'
      puts "Грузовой поезд #{train.id} отправляется со станции #{@name}"
    else
      puts "Пассажирский поезд #{train.id} отправляется со станции #{@name}"
    end
    @trains.delete(train)
  end

  def train_by_type(type)
    @trains.select { |t| t.type == type }
  end
end

class Train 
  attr_reader :id, :type, :car_quantity, :speed, :station_index

  def initialize(id, type, car_quantity = 0)
    @id = id
    @type = type
    @car_quantity = car_quantity
    @speed = 0
  end

  def brake
    @speed = 0
  end

  def speed_up(num)
    @speed += num.abs
  end

  def hook
    if @speed == 0
      puts "Поезд #{id}: Вагон успешно прицеплен"
      @car_quantity += 1
    else
      puts "Поезд #{id}: Невозвожно прицепить вагон во время движения"
    end
  end

  def unhook
    if @speed == 0
      puts "Поезд #{id}: Вагон успешно отцеплен"
      @car_quantity -= 1
    else
      puts "Поезд #{id}: Невозвожно отцепить вагон во время движения"
    end
  end

  def take_route(route)
    puts "Поезд #{id}: установлен маршрут #{route.stations[0].name} - #{route.stations[-1].name}"
    @route = route
    @station_index = 0
    route.stations[0].take_train(self)
  end

  def move_forward
    if @route.stations[-1] != self
      @route.stations[@station_index].send_train(self)
      @station_index += 1
      @route.stations[station_index].take_train(self)
    end
  end

  def move_back
    if @route.stations[0] != self
      @route.stations[@station_index].send_train(self)
      @station_index -= 1
      @route.stations[station_index].take_train(self)
    end
  end

  def current_station
    puts "Поезд #{id}: текущая остановка - #{@route.stations[@station_index].name}"
    @route.stations[@station_index]
  end

  def next_station
    if current_station != @route.stations.last
      puts "Поезд #{id}: следущая остановка - #{@route.stations[@station_index+1].name}"
      @route.stations[@station_index + 1]
    end
  end

  def prev_station
    if current_station != @route.stations.first
      puts "Поезд #{id}: предидущая остановка - #{@route.stations[@station_index - 1].name}"
      @route.stations[@station_index - 1]
    end
  end
end

class Route
  attr_reader :stations

  def initialize(firts_station, last_station)
    @stations = [firts_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if station != @stations.last && station != @stations.first
      @stations.delete(station)
    end
  end
end

station1 = Station.new('Первая')
station2 = Station.new('Вторая')
station3 = Station.new('Третья')

train = Train.new('A45', 'cargo')
route = Route.new(station1, station3)
route.add_station(station2)
train.take_route(route)
train.hook
train.hook
train.hook
train.move_forward
train.move_forward
train.next_station
