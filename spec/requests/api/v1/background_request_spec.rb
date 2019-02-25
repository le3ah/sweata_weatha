require 'rails_helper'

describe 'Background API' do
  it "retrieves an image based on the location", :vcr do
    location = create(:location)

    get "/api/v1/backgrounds?location=#{location["city"]},#{location["state"]}"

    backgrounds = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(backgrounds[:data]).to have_key(:id)
    expect(backgrounds[:data]).to have_key(:type)
    expect(backgrounds[:data][:attributes]).to have_key(:title)
    expect(backgrounds[:data][:attributes]).to have_key(:background_url)
  end
end
