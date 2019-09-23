require_relative 'company'

class CargoCar
  include Company

  attr_reader :volume, :reserved_volume

  def initialize(volume)
    @volume = volume.to_i
    @reserved_volume = 0
  end

  def reserve_volume(value)
    @reserved_volume += value.to_i
  end

  def free_volume
    volume - reserved_volume
  end
end
