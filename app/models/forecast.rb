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
    GeocodingService.new(@city, @state).find_latitude
  end

  def get_longitude
    GeocodingService.new(@city, @state).find_longitude
  end

  def current_weather
    DarkSkyService.new.get_weather(@latitude, @longitude)[:currently]
  end

  def daily_weather
    DarkSkyService.new.get_weather(@latitude, @longitude)[:daily]
  end

  def hourly_weather
    DarkSkyService.new.get_weather(@latitude, @longitude)[:hourly]
  end
end
