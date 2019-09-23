class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    validate_name!
    @trains = []
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def name_format
    /[а-яa-z]{2,}/i
  end

  def validate_name!
    raise 'Неверный формат имени' if name !~ name_format

    true
  end

  def valid?
    validate_name!
  rescue StandardError
    false
  end

  def each_train
    trains.each do |train|
      yield(train)
    end
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def train_by_type(type)
    @trains.select { |t| t.class == type }
  end
end
