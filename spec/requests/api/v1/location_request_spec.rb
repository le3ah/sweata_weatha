require 'rails_helper'

describe 'Location API' do
  it "sends the city and state" do
  location = create(:location)

  get "/api/v1/forecast?location=#{location["city"]},#{location["state"]}"

  locations = JSON.parse(response.body)

  expect(response).to be_successful
  expect(locations[0]["city"]).to eq(location["city"])
  expect(locations[0]["state"]).to eq(location["state"])
  end
end
