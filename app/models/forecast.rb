class Forecast
  attr_reader :latitude,
              :longitude,
              :currently,
              :hourly,
              :daily

  def initialize(attributes)
    @latitude = attributes[:latitude]
    @longitude = attributes[:longitude]
    @currently = attributes[:currently]
    @hourly = attributes[:hourly][:data]
    @daily = attributes[:daily][:data]
  end

  def current_weather
    CurrentWeather.new(@currently)
  end

  def daily_weather
    @daily.map do |raw_day|
      DailyWeather.new(raw_day)
    end
  end

  def hourly_weather
    @hourly.map do |raw_hour|
      HourlyWeather.new(raw_hour)
    end
  end
end
