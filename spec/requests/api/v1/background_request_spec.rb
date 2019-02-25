require 'rails_helper'

describe 'Background API' do
  it "retrieves an image based on the location", :vcr do
    location = create(:location)
  
    get "/api/v1/backgrounds?location=#{location["city"]},#{location["state"]}"

    backgrounds = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(backgrounds[:city]).to eq(location[:city])
    expect(backgrounds[:state]).to eq(location[:state])
    expect(backgrounds[:_background_data][:photos][:photo][0]).to have_key(:farm)
    expect(backgrounds[:_background_data][:photos][:photo][0]).to have_key(:server)
    expect(backgrounds[:_background_data][:photos][:photo][0]).to have_key(:id)
    expect(backgrounds[:_background_data][:photos][:photo][0]).to have_key(:secret)
    expect(backgrounds[:_background_data][:photos][:photo][0]).to have_key(:title)
  end
end
