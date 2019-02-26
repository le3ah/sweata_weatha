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

  def location_data
    @_location_data ||= GeocodingService.new.find_coordinates(split_location[0], split_location[1])
  end

  def weather_data
    lat = location_data[:lat]
    long = location_data[:lng]
    @_weather_data ||= DarkSkyService.new.get_weather(lat, long)
  end
end
