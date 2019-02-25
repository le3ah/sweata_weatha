class GifFacade
  def initialize(location)
    city_state = location.split(',')
    @city = city_state[0].capitalize
    @state = city_state[1].upcase
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

  def get_keyword
    forecast_data[:daily][:data].map do |raw_day|
      DailyWeather.new(raw_day)
    end
  end

  def gif_data
    get_keyword.each do |daily_weather|
      GifService.new.find_gifs(daily_weather.precip_type)
      binding.pry
    end
  end

  def get_gif_url
    # binding.pry
    results = gif_data[:images][:fixed_width][:url]
  end
end
