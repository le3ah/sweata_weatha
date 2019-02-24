class Forecast
  attr_reader :city, :state, :latitude, :longitude
  def initialize(location)
    city_state = location.split(',')
    @city = city_state[0].capitalize
    @state = city_state[1].upcase
    @latitude = get_latitude
    @longitude = get_longitude
    @currently = current_weather
  end

  def get_latitude
    location_data.find_latitude
  end

  def get_longitude
    location_data.find_longitude
  end

  def location_data
    @_location_data ||= GeocodingService.new(@city, @state)
  end

  def weather_data
    @_weather_data ||= DarkSkyService.new.get_weather(@latitude, @longitude)
  end

  def current_weather
    results = weather_data[:currently]
    CurrentWeather.new(results)
  end

  def daily_weather
    results = weather_data[:daily]
    DailyWeather.new(results)
  end

  def hourly_weather
    weather_data[:hourly]
  end
end
