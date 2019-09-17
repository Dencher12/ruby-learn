require_relative 'company'

class PassengerCar
  include Company

  attr_reader :seats_number, :reserved_places

  def initialize(seats_number)
    @seats_number = seats_number.to_i
    @reserved_places = 0
  end

  def reserve_place
    @reserved_places += 1
  end

  def free_places
    seats_number - reserved_places
  end
end
