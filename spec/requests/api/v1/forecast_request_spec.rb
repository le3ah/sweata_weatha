require 'rails_helper'

describe 'Forecast API' do
  it "gets the lat and long and sends the city and state", :vcr do
    location = create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"

    forecasts = JSON.parse(response.body, symbolize_names: true)

    latitude = '39.7392358'
    longitude = '-104.990251'

    expect(response).to be_successful
    expect(forecasts[:data][:attributes][:latitude]).to eq(latitude.to_f)
    expect(forecasts[:data][:attributes][:longitude]).to eq(longitude.to_f)
  end

  it "returns the weather currently", :vcr do
    location = create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"
    forecasts = JSON.parse(response.body, symbolize_names: true)

    expect(forecasts[:data][:attributes]).to have_key(:currently)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:icon)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:summary)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:current_temperature)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:current_time)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:date)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:feels_like)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:humidity)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:visibility)
    expect(forecasts[:data][:attributes][:currently]).to have_key(:uv_index)
  end
  it "returns the weather daily", :vcr do
    location = create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"
    forecasts = JSON.parse(response.body, symbolize_names: true)

    expect(forecasts[:data][:attributes]).to have_key(:daily)
    expect(forecasts[:data][:attributes][:daily][0]).to have_key(:precip_probability)
    expect(forecasts[:data][:attributes][:daily][0]).to have_key(:precip_type)
    expect(forecasts[:data][:attributes][:daily][0]).to have_key(:temperature_high)
    expect(forecasts[:data][:attributes][:daily][0]).to have_key(:temperature_low)
  end
  it "returns the weather hourly", :vcr do
    location = create(:location)

    get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"
    forecasts = JSON.parse(response.body, symbolize_names: true)

    expect(forecasts[:data][:attributes]).to have_key(:hourly)
    expect(forecasts[:data][:attributes][:hourly][0]).to have_key(:hourly_time)
    expect(forecasts[:data][:attributes][:hourly][0]).to have_key(:hourly_temperature)
    expect(forecasts[:data][:attributes][:hourly][0]).to have_key(:hourly_icon)
  end
end
