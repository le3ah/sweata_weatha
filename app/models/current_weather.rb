class CurrentWeather
  attr_reader :summary,
              :icon,
              :temperature_high,
              :temperature_low,
              :current_temperature,
              :current_time,
              :date,
              :feels_like,
              :humidity,
              :visability,
              :uv_index
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
