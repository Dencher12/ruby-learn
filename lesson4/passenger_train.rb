class PassengerTrain < Train
  def initialize(name)
    super(name)
  end

  def hook(car)
    super(car, PassengerCar)
  end
end
