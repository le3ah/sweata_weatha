require 'rails_helper'

describe HourlyWeather do
  it "exists", :vcr do
    attributes = {time: 1551211200,
                  temperature: 83,
                  icon: "Rain"}
    daily_weather = HourlyWeather.new(attributes)
    expect(daily_weather).to be_a(HourlyWeather)
  end
end
