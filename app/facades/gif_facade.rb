# class GifFacade
#   def initialize(location)
#     city_state = location.split(',')
#     @city = city_state[0].capitalize
#     @state = city_state[1].upcase
#   end
#
#   def location_data
#     @_location_data ||= GeocodingService.new.find_coordinates(@city, @state)
#   end
#
#   def forecast_data
#     lat = location_data[:lat]
#     long = location_data[:lng]
#     @_forecast_data ||= DarkSkyService.new.get_weather(lat, long)[:daily][:data]
#   end
#
#   def get_daily_weather
#     forecast_data.map do |raw_day|
#       DailyWeather.new(raw_day)
#     end
#   end
#
#   def gif_daily_data
#     get_daily_weather.map do |daily_weather|
#       url = GifService.find_gifs(daily_weather.precip_type).first[:url]
#       time = daily_weather.time
#       summary = daily_weather.today_summary
#       Gif.new(url,time,summary)
#     end
#   end
# end
