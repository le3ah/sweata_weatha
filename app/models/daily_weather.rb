class DailyWeather
  attr_reader :today_summary,
              :precip_probability,
              :precip_type,
              :temperature_high,
              :temperature_low,
              :time
  def initialize(attributes)
    # binding.pry
    @today_summary = attributes[:summary]
    @precip_probability = (attributes[:precipProbability].to_f * 100).round(0)
    @precip_type = attributes[:precipType]
    @temperature_high = attributes[:temperatureHigh]
    @temperature_low = attributes[:temperatureLow]
    @time = Time.at(attributes[:time]).strftime("%A")
  end
end
