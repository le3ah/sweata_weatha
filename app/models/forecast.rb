class Forecast
  attr_reader :city,
              :state,
              :latitude,
              :longitude,
              :currently,
              :hourly,
              :daily,
              :tonight_summary
  def initialize(location)
    city_state = location.split(',')
    @city = city_state[0].capitalize
    @state = city_state[1].upcase
    @latitude = get_latitude
    @longitude = get_longitude
    @currently = current_weather
    @hourly = hourly_weather[0..7]
    @daily = daily_weather[0..4]
    @tonight_summary = get_tonight_summary
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
    @_weather_data ||= DarkSkyService.new.get_weather(@latitude, @longitude)
  end

  def current_weather
    results = weather_data[:currently]
    CurrentWeather.new(results)
  end

  def daily_weather
    results = weather_data[:daily][:data]
    results.map do |raw_day|
      DailyWeather.new(raw_day)
    end
  end

  def hourly_weather
    results = weather_data[:hourly][:data]
    results.map do |raw_hour|
      HourlyWeather.new(raw_hour)
    end
  end

  def get_tonight_summary
    weather_data[:hourly][:data].last[:summary]
  end
end
