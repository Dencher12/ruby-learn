class PassengerTrain < Train
  def initialize(id)
    @id = id
    @cars = []
    @speed = 0
  end

  def hook(car)
    super(car, PassengerCar)
  end
end
