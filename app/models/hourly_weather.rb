class HourlyWeather
  attr_reader :hourly_time,
              :hourly_temperature, 
              :hourly_icon
  def initialize(attributes)
    @hourly_time = Time.at(attributes[:time]).strftime("%l %P")
    @hourly_temperature = attributes[:temperature]
    @hourly_icon = attributes[:icon]
  end
end
