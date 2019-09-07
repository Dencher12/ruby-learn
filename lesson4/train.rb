class Train
  attr_reader :id, :car_quantity, :speed, :station_index

  def initialize(id)
    @id = id
    @car_quantity = car_quantity
    @speed = 0
    puts @type.class
  end

  def brake
    @speed = 0
  end

  def speed_up(num)
    @speed += num.abs
  end

  def hook
    if @speed.zero
      puts "Поезд #{id}: Вагон успешно прицеплен"
      @car_quantity += 1
    else
      puts "Поезд #{id}: Невозвожно прицепить вагон во время движения"
    end
  end

  def unhook
    if @speed.zero && @car_quantity.positive
      puts "Поезд #{id}: Вагон успешно отцеплен"
      @car_quantity -= 1
    else
      puts "Поезд #{id}: Невозвожно отцепить вагон во время движения"
    end
  end

  def take_route(route)
    puts "Поезд #{id}: установлен маршрут #{route.name}"
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

  def forward
    @station_index += 1 if @route.stations.last != current_station
  end

  def back
    @station_index -= 1 if @route.stations.first != current_station
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
end