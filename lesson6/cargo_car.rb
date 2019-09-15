require_relative 'company'

class CargoCar
  include Company

  def initialize
    register_instance
  end
end
