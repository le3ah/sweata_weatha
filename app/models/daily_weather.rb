class DailyWeather
  def initialize(attributes)
    @today_summary = attributes[:today_summary]
    @precip_probability = attributes[:precip_probability]
    @precip_type = attributes[:precip_type]
    @temperature_high = attributes[:temperature_high]
    @temperature_low = attributes[:temperature_low]
  end
end
