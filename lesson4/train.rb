class Train
  attr_reader :name, :car_quantity, :speed, :station_index

  def initialize(name)
    @name = name
    @speed = 0
    @cars = []
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
      puts "Поезд #{@name}: Вагон успешно прицеплен"
    else
      puts "Поезд #{@name}: Ошибка (скорость > 0 или это не грузовой вагон)"
    end
  end

  def unhook(car)
    if @speed.zero?
      puts "Поезд #{@name}: Вагон успешно отцеплен"
      @cars.delete(car)
    else
      puts "Поезд #{@name}: Невозвожно отцепить вагон во время движения"
    end
  end

  def take_route(route)
    puts "Поезд #{@name}: установлен маршрут #{route.name}"
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