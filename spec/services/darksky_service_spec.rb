require 'rails_helper'

describe DarkSkyService do
  it "can get weather" do
    location = create(:location)
    geocoding_service = GeocodingService.new(location)
    latitude = geocoding_service.find_latitude
    longitude = geocoding_service.find_longitude

    darksky_service = DarkSkyService.new

    result = darksky_service.get_weather(latitude, longitude)

    expect(result[:latitude]).to eq(latitude.to_f)
    expect(result[:longitude]).to eq(longitude.to_f)
    expect(result).to have_key(:currently)
    expect(result).to have_key(:timezone)
    expect(result[:currently]).to have_key(:humidity)
    expect(result[:currently]).to have_key(:uvIndex)
    expect(result[:currently]).to have_key(:visibility)
    expect(result[:currently]).to have_key(:apparentTemperature)
    expect(result[:currently]).to have_key(:summary)
    expect(result[:currently]).to have_key(:icon)
    expect(result[:currently]).to have_key(:temperature)
    expect(result[:currently]).to have_key(:time)

    expect(result).to have_key(:daily)
    expect(result[:daily]).to have_key(:summary)
    expect(result[:daily]).to have_key(:data)
    expect(result[:daily][:data].first).to have_key(:precipProbability)
    expect(result[:daily][:data].first).to have_key(:precipType)
    expect(result[:daily][:data].first).to have_key(:temperatureHigh)
    expect(result[:daily][:data].first).to have_key(:temperatureLow)

    expect(result).to have_key(:hourly)
    expect(result[:hourly][:data].first).to have_key(:icon)
    expect(result[:hourly][:data].first).to have_key(:temperature)
    expect(result[:hourly][:data].first).to have_key(:time)
  end
end
