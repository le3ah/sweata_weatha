require 'rails_helper'

describe  'Favorites API' do
  it "posts city and api key", :vcr do
    email = "mom@gmail.com"
    password = "123"
    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result[:attributes]).to have_key(:api_key)
    api_key = result[:attributes][:api_key]
    location = create(:location)

    post "/api/v1/favorites?location=#{location["city"]},#{location["state"]}&api_key=#{api_key}"

    expect(response).to be_successful
  end
  it "posts city without api key", :vcr do
    email = "mom@gmail.com"
    password = "123"
    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result[:attributes]).to have_key(:api_key)
    location = create(:location)

    post "/api/v1/favorites?location=#{location["city"]},#{location["state"]}"

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end
end
