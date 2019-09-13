class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def take_train(train)
    if train.class == CargoTrain
      puts "Грузовой поезд #{train.name} прибывает на станцию #{@name}"
    else
      puts "Пассажирский поезд #{train.name} прибывает на станцию #{@name}"
    end
    @trains << train
  end

  def send_train(train)
    if train.class == CargoTrain
      puts "Грузовой поезд #{train.name} отправляется со станции #{@name}"
    else
      puts "Пассажирский поезд #{train.name} отправляется со станции #{@name}"
    end
    @trains.delete(train)
  end

  def train_by_type(type)
    @trains.select { |t| t.class == type }
  end
end
