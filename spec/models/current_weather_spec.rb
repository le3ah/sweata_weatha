require 'rails_helper'

describe CurrentWeather do
  it "exists", :vcr do
    attributes = {today_summary: "Sunny",
                  icon: "Sunny",
                  temperatureHigh: 85,
                  temperatureLow: 65,
                  temperature: 83,
                  time: 1551211200,
                  apparentTemperature: 45,
                  visbility: 45,
                  uvIndex: 45,
                  humidity: 23}
    daily_weather = CurrentWeather.new(attributes)
    expect(daily_weather).to be_a(CurrentWeather)
  end
end
