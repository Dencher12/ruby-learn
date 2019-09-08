class CargoTrain < Train
  def initialize(name)
    super(name)
  end

  def hook(car)
    super(car, CargoCar)
  end
end
