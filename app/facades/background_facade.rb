class BackgroundFacade
  def initialize(location)
    city_state = location.split(',')
    @city = city_state[0].capitalize
    @state = city_state[1].upcase
  end

  def get_latitude
    location_data.find_latitude
  end

  def get_longitude
    location_data.find_longitude
  end

  def location_data
    @_location_data ||= GeocodingService.new(@city, @state)
  end

  def background_data
    lat = get_latitude
    long = get_longitude
    @_background_data ||= FlickrService.new.get_background(lat, long)
  end

  def get_background_url
    results = background_data[:photos][:photo][0]
    Background.new(results)
  end
end
