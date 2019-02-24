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
end
