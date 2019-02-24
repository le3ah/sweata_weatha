require 'rails_helper'

describe Forecast do
  it "exists", :vcr do
    location = "Denver,CO"
    forecast = Forecast.new(location)
    expect(forecast).to be_a(Forecast)
  end
  it "#get_latitude", :vcr do
    location = "Denver,CO"
    forecast = Forecast.new(location)
    expect(forecast.get_latitude).to eq(39.7392358)
  end
  it "#get_longitude", :vcr do
    location = "Denver,CO"
    forecast = Forecast.new(location)
    expect(forecast.get_longitude).to eq(-104.990251)
  end
  it "#get_tonight_summary", :vcr do
    location = "Denver,CO"
    forecast = Forecast.new(location)
    summary = forecast.weather_data[:hourly][:data].last[:summary]
    expect(forecast.get_tonight_summary).to eq(summary)
  end
end
