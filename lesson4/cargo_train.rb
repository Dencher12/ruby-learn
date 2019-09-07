class CargoTrain < Train
  def initialize(id)
    super(id)
    @id = id
    @cars = []
    @speed = 0
  end

  def hook(car)
    if @speed.zero && car.class == CargoCar
      @cars << car
      puts "Поезд #{id}: Вагон успешно прицеплен"
    else
      puts "Поезд #{id}: Ошибка (скорость > 0 или это не грузовой вагон)"
    end
  end
end
