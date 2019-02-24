class CurrentWeather
  attr_reader :summary
  def initialize(attributes)
    @icon = attributes[:icon]
    @summary = attributes[:summary]
    @temperature_high = attributes[:temperatureHigh]
    @temperature_low = attributes[:temperatureLow]
    @current_temperature = attributes[:temperature]
    @current_time = Time.at(attributes[:time]).strftime("%l %P")
    @date = Time.at(attributes[:time]).strftime("%-m/%-d")
    @feels_like = attributes[:apparentTemperature]
    @humidity = attributes[:humidity]
    @visability = attributes[:visbility]
    @uv_index = attributes[:uvIndex]
  end
end
