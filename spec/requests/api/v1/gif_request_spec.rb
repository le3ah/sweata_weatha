require 'rails_helper'

describe 'Gif API' do
  it "provides animated gif based on the Dark Sky API", :vcr do
    location = create(:location)

    get "/api/v1/gifs?location=#{location["city"]},#{location["state"]}"

    gifs = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(gifs[:data][0]).to have_key(:attributes)
    expect(gifs[:data][0][:attributes]).to have_key(:time)
    expect(gifs[:data][0][:attributes]).to have_key(:summary)
    expect(gifs[:data][0][:attributes]).to have_key(:url)
  end
end
