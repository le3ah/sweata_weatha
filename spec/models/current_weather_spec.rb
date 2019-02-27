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
    current_weather = CurrentWeather.new(attributes)
    expect(current_weather).to be_a(CurrentWeather)
  end
  it "has attributes", :vcr do
    attributes = {today_summary: "Sunny",
                  icon: "Sunny",
                  temperature: 83,
                  time: 1551211200,
                  apparentTemperature: 45,
                  visbility: 45,
                  uvIndex: 45,
                  humidity: 23}
    current_weather = CurrentWeather.new(attributes)
    expect(current_weather.icon).to eq(attributes[:icon])
    expect(current_weather.current_temperature).to eq(attributes[:temperature])
    expect(current_weather.feels_like).to eq(attributes[:apparentTemperature])
    expect(current_weather.uv_index).to eq(attributes[:uvIndex])
    expect(current_weather.humidity).to eq(attributes[:humidity])
  end
end
