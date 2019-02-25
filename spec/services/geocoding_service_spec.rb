describe GeocodingService do
  it "exists", :vcr do
    location = create(:location)

    geocoding_service = GeocodingService.new
    expect(geocoding_service).to be_a(GeocodingService)
  end

  it 'returns the latitude and logitude of a city and state', :vcr do
    location = create(:location)

    latitude = '39.7392358'
    longitude = '-104.990251'
    geocoding_service = GeocodingService.new.find_coordinates("#{location[:city]}", "#{location[:state]}")

    lat_coordinate = geocoding_service[:lat]
    lng_coordinate = geocoding_service[:lng]

    expect(lat_coordinate).to eq(latitude.to_f)
    expect(lng_coordinate).to eq(longitude.to_f)
  end
end
