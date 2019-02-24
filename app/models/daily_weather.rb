class DailyWeather
  def initialize(attributes)
    @today_summary = attributes[:summary]
    @precip_probability = attributes[:precipProbability]
    @precip_type = attributes[:precipType]
    @temperature_high = attributes[:temperatureHigh]
    @temperature_low = attributes[:temperatureLow]
  end
end
