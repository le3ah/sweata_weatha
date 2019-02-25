class ForecastFacade
  def initialize(location)
    city_state = location.split(',')
    @city = city_state[0].capitalize
    @state = city_state[1].upcase
  end

  def get_forecast
    results = weather_data
    Forecast.new(results)
  end
  def get_latitude
    location_data[:lat]
  end

  def get_longitude
    location_data[:lng]
  end

  def location_data
    @_location_data ||= GeocodingService.new.find_coordinates(@city, @state)
  end

  def weather_data
    lat = get_latitude
    long = get_longitude
    @_weather_data ||= DarkSkyService.new.get_weather(lat, long)
  end
end
