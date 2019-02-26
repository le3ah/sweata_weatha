class ForecastFacade
  def initialize(location)
    @location = location
  end

  def get_forecast
    results = weather_data
    Forecast.new(results)
  end

  def split_location
    @location.split(',')
  end
  def get_latitude
    location_data[:lat]
  end

  def get_longitude
    location_data[:lng]
  end

  def location_data
    @_location_data ||= GeocodingService.new.find_coordinates(split_location[0], split_location[1])
  end

  def weather_data
    lat = get_latitude
    long = get_longitude
    @_weather_data ||= DarkSkyService.new.get_weather(lat, long)
  end
end
