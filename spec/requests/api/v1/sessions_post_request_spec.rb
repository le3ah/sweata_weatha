require 'rails_helper'

describe 'Sessions API' do
  it "returns api key when email & password are accepted" do
    User.create(email: "mom@gmail.com", password: "password", password_confirmation: "password")
    email = "mom@gmail.com"
    password = "password"

    post "/api/v1/sessions?email=#{email}&password=#{password}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)
    expect(result[:data]).to have_key(:id)
    expect(result[:data]).to have_key(:type)
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:api_key)
  end
  it "returns error  when email & password are incorrect" do
    User.create(email: "mom@gmail.com", password: "password", password_confirmation: "password")
    email = "mom@gmail.com"

    post "/api/v1/sessions?email=#{email}&password=123"

    expect(response.body).to eq("This is bad")
  end
end
