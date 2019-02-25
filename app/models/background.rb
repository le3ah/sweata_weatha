class Background
  attr_reader :city,
              :state,
              :latitude,
              :longitude,
              :background_img
  def initialize(location)
    city_state = location.split(',')
    @city = city_state[0].capitalize
    @state = city_state[1].upcase
    @latitude = get_latitude
    @longitude = get_longitude
    @background_img = current_background
  end

  def get_background_url
    results = background_data[:photos][:photo][0]
    Flickr.new(results)
  end

  def current_background
    data = get_background_url
    "https://farm#{data.farm_id}.staticflickr.com/#{data.server_id}/#{data.id}_#{data.secret}.jpg"
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
    @_background_data ||= FlickrService.new.get_background(@latitude, @longitude)
  end

end
