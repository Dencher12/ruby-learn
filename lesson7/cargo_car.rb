require_relative 'company'

class CargoCar
  include Company

  attr_reader :volume, :reserved_volume

  def initialize(volume)
    @volume = volume
  end

  def reserve_volume(value)
    @reserved_volume ||= 0
    @reserved_volume += value
  end

  def free_volume
    volume - reserved_volume
  end
end
