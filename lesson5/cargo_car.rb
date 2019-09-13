require_relative 'company'
require_relative 'instance_counter'

class CargoCar
  include InstanceCounter
  include Company

  def initialize
    register_instance
  end
end
