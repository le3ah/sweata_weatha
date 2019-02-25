require 'rails_helper'

describe 'Users API' do
  before { post '/api/v1/users', params: { "email" => "gob@bluth.com", "password" => "password", "password_confirmation" => "password"} }

  it "sends an email and password", :vcr do
    post "/api/v1/users"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result). to have_key("email")
  end
end
