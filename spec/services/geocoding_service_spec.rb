describe GeocodingService do
  it "exists" do
    location = create(:location)
    # token = ENV["geocoding_api_key"]
    geocoding_service = GeocodingService.new(location)
    expect(geocoding_service).to be_a(GeocodingService)
  end

  it 'returns the latitude and logitude of a city and state' do
    location = create(:location)

    latitude = '39.7541'
    longitude = '-105.0002'
    geocoding_service = GeocodingService.new(location)

    coordinates = geocoding_service.find_coordinates
    expect(coordinates).to have_key(:lat)
    expect(coordinate).to have_key(:lng)
  end
end
