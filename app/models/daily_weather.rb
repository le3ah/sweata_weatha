class DailyWeather
  def initialize(attributes)
    @today_summary = attributes[:summary]
    @precip_probability = attributes[:data][0][:precipProbability]
    @precip_type = attributes[:data][0][:precipType]
    @temperature_high = attributes[:data][0][:temperatureHigh]
    @temperature_low = attributes[:data][0][:temperatureLow]
  end
end
