class HourlyWeather
  def initialize(attributes)
    @hourly_time = Time.at(attributes[:time]).strftime("%l")
    @hourly_temperature = attributes[:temperature]
    @hourly_icon = attributes[:icon]
  end
end
