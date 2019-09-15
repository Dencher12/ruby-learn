class Route
  attr_reader :stations, :name

  def initialize(firts_station, last_station)
    @stations = [firts_station, last_station]
    @name = "#{firts_station.name} - #{last_station.name}"
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    if station != @stations.last && station != @stations.first
      @stations.delete(station)
    end
  end
end