describe GeocodingService do
  it "exists", :vcr do
    location = create(:location)

    geocoding_service = GeocodingService.new(location)
    expect(geocoding_service).to be_a(GeocodingService)
  end

  it 'returns the latitude and logitude of a city and state', :vcr do
    location = create(:location)

    latitude = '39.7392358'
    longitude = '-104.990251'
    geocoding_service = GeocodingService.new(location)

    lat_coordinate = geocoding_service.find_latitude
    lng_coordinate = geocoding_service.find_longitude

    expect(lat_coordinate).to eq(latitude.to_f)
    expect(lng_coordinate).to eq(longitude.to_f)
  end
end
