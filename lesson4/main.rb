require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'

require_relative 'cargo_car'
require_relative 'passenger_car'



st1 = Station.new('First')
st2 = Station.new('Second')

ro = Route.new(st1, st2)

tr = PassengerTrain.new('FS-12')
car = PassengerCar.new
tr.hook(car)

tr.take_route(ro)

tr.move(:forward)
tr.move(:back)
