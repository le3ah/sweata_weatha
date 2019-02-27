require 'rails_helper'

describe DailyWeather do
  it "exists", :vcr do
    attributes = {summary: "Sunny",
                  precipProbability: 83,
                  precipType: "Rain",
                  temperatureHigh: 45,
                  temperatureLow: 23,
                  time: 1551211200}
    daily_weather = DailyWeather.new(attributes)
    expect(daily_weather).to be_a(DailyWeather)
  end
  it "has attributes", :vcr do
    attributes = {summary: "Sunny",
                  precipProbability: 83,
                  precipType: "Rain",
                  temperatureHigh: 45,
                  temperatureLow: 23,
                  time: 1551211200}
    daily_weather = DailyWeather.new(attributes)
    expect(daily_weather.today_summary).to eq(attributes[:summary])
    expect(daily_weather.precip_probability).to eq(attributes[:precipProbability])
    expect(daily_weather.precip_type).to eq(attributes[:precipType])
    expect(daily_weather.temperature_high).to eq(attributes[:temperatureHigh])
    expect(daily_weather.temperature_low).to eq(attributes[:temperatureLow])
  end
end
