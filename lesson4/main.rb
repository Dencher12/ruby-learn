require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'

st1 = Station.new('First')
st2 = Station.new('Second')

ro = Route.new(st1, st2)

tr = CargoTrain.new('FS-12')
tr.take_route(ro)

tr.move(:forward)
tr.move(:back)
