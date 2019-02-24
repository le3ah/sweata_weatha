require 'rails_helper'

describe DailyWeather do
  it "exists", :vcr do
    attributes = {today_summary: "Sunny",
                  precip_probability: 83,
                  precip_type: "Rain",
                  temperature_high: 45,
                  temperature_low: 23}
    daily_weather = DailyWeather.new(attributes)
    expect(daily_weather).to be_a(DailyWeather)
  end
end
