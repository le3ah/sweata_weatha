require 'rails_helper'

describe 'Forecast API' do
  it "gets the lat and long and sends the city and state", :vcr do
    location = create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"

    forecasts = JSON.parse(response.body)

    latitude = '39.7392358'
    longitude = '-104.990251'

    expect(response).to be_successful

    expect(forecasts["data"]["attributes"]["city"]).to eq(location["city"])
    expect(forecasts["data"]["attributes"]["state"]).to eq(location["state"])
    expect(forecasts["data"]["attributes"]["latitude"]).to eq(latitude.to_f)
    expect(forecasts["data"]["attributes"]["longitude"]).to eq(longitude.to_f)
  end

  it "returns the weather currently", :vcr do
    location = create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"
    forecasts = JSON.parse(response.body, symbolize_names: true)

    expect(forecasts[:data][:attributes]).to have_key(:currently)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:humidity)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:uvIndex)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:visibility)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:apparentTemperature)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:summary)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:icon)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:temperature)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:time)
  end
  it "returns the weather daily", :vcr do
    location = create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"
    forecasts = JSON.parse(response.body, symbolize_names: true)

    expect(forecasts[:data][:attributes]).to have_key(:daily)
    expect(forecasts[:data][:attributes][:daily]).to have_key(:summary)
    expect(forecasts[:data][:attributes][:daily][:data][0]).to have_key(:precipProbability)
    expect(forecasts[:data][:attributes][:daily][:data][0]).to have_key(:precipType)
    expect(forecasts[:data][:attributes][:daily][:data][0]).to have_key(:temperatureHigh)
    expect(forecasts[:data][:attributes][:daily][:data][0]).to have_key(:temperatureLow)
    expect(forecasts[:data][:attributes][:daily][:data][0]).to have_key(:summary)
  end
  it "returns the weather hourly", :vcr do
    location = create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"
    forecasts = JSON.parse(response.body, symbolize_names: true)

    expect(forecasts[:data][:attributes]).to have_key(:hourly)
    expect(forecasts[:data][:attributes][:hourly]).to have_key(:icon)
    expect(forecasts[:data][:attributes][:hourly][:data][0]).to have_key(:temperature)
    expect(forecasts[:data][:attributes][:hourly][:data][0]).to have_key(:time)
  end
end
