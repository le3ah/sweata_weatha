require 'rails_helper'

describe 'Location API' do
  it "sends the city and state" do
  location_data = create(:location)

  get "/api/v1/forecast?location=#{location_data}"

  location = JSON.parse(response.body)

  expect(repsonse).to be_successful
  expect(location["city"]).to eq(location["city"])
  expect(location["state"]).to eq(location["state"])
  end
end
