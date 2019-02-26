require 'rails_helper'

describe 'Users API' do
  before { post '/api/v1/users', params: { "email" => "gob@bluth.com", "password" => "password", "password_confirmation" => "password"} }

  it "sends an email and password", :vcr do

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(result).to have_key(:id)
    expect(result).to have_key(:type)
    expect(result).to have_key(:attributes)
    expect(result[:attributes]).to have_key(:api_key)
  end

  it "sends an email and password", :vcr do
    email = "mom@gmail.com"
    password = "123"
    password_confirmation = "321"
    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password_confirmation}"
    expect(response.body).to eq("Incorrect password")
  end
end
