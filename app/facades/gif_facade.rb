class GifFacade
  def initialize(location)
    city_state = location.split(',')
    @city = city_state[0].capitalize
    @state = city_state[1].upcase
  end

  def get_keyword
    forecast_data
  end

  def get_latitude
    location_data[:lat]
  end

  def get_longitude
    location_data[:lng]
  end

  def location_data
    @_location_data ||= GeocodingService.new.find_coordinates(@city, @state)
  end

  def forecast_data
    lat = get_latitude
    long = get_longitude
    @_forecast_data ||= DarkSkyService.new.get_weather(lat, long)
  end

  def gif_data
    keyword = get_keyword
    @_gif_data ||= GifService.new.find_gifs(keyword)
  end

  def get_gif_url
    results = gif_data
    Gif.new(results)
  end
end
