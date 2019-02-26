require 'rails_helper'

describe 'Favorites API' do
  it "retrieves favorites based on the api key", :vcr do
    email = "mom@gmail.com"
    password = "123"
    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password}"
    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result[:attributes]).to have_key(:api_key)
    api_key = result[:attributes][:api_key]

    location_1 = create(:location, city: "Cullman", state: "AL")
    location_2 = create(:location, city: "Charleston", state: "SC")
    post "/api/v1/favorites?location=#{location_1[:city]},#{location_1[:state]}&api_key=#{api_key}"
    expect(response).to be_successful

    post "/api/v1/favorites?location=#{location_2[:city]},#{location_2[:state]}&api_key=#{api_key}"
    expect(response).to be_successful

    get "/api/v1/favorites?api_key=#{api_key}"
    expect(response).to be_successful

    favorites = JSON.parse(response.body, symbolize_names: true)

    expect(favorites[0][:location]).to eq("#{location_1[:city]},#{location_1[:state]}")
    expect(favorites[1][:location]).to eq("#{location_2[:city]},#{location_2[:state]}")
  end
end 
