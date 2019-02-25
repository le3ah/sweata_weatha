require 'rails_helper'

describe DarkSkyService do
  it "can get weather", :vcr do
    location = create(:location)
    geocoding_service = GeocodingService.new.find_coordinates("#{location[:city]}", "#{location[:state]}")
    latitude = geocoding_service[:lat]
    longitude = geocoding_service[:lng]

    darksky_service = DarkSkyService.new
    expect(darksky_service).to be_a(DarkSkyService)

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
    expect(result[:daily][:data].last).to have_key(:summary)

    expect(result).to have_key(:hourly)
    expect(result[:hourly][:data].first).to have_key(:icon)
    expect(result[:hourly][:data].first).to have_key(:temperature)
    expect(result[:hourly][:data].first).to have_key(:time)
  end
end
