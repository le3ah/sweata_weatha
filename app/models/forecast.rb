class Forecast
  attr_reader :city, :state, :latitude, :longitude
  def initialize(location)
    city_state = location.split(',')
    @city = city_state[0].capitalize
    @state = city_state[1].upcase
    @latitude = get_latitude
    @longitude = get_longitude
  end

  def get_latitude
    location_data.find_latitude
  end

  def get_longitude
    location_data.find_longitude
  end

  def location_data
    GeocodingService.new(@city, @state)
  end

  def weather_data
    DarkSkyService.new.get_weather(@latitude, @longitude)
  end
  
  def current_weather
    weather_data[:currently]
  end

  def daily_weather
    weather_data[:daily]
  end

  def hourly_weather
    weather_data[:hourly]
  end
end
