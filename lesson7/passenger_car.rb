require_relative 'company'

class PassengerCar
  include Company

  attr_reader :seats_number, :reserved_places

  def initialize(seats_number)
    @seats_number = seats_number
  end

  def reserve_place
    @reserved_places ||= 0
    @reserved_places += 1
  end

  def free_places
    seats_number - reserved_places
  end
end
