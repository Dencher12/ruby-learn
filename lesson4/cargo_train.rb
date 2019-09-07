class CargoTrain < Train
  def initialize(id)
    @id = id
    @cars = []
    @speed = 0
  end

  def hook(car)
    super(car, CargoCar)
  end
end
