# class ForecastFacade
#   def initialize(location)
#     @location = location
#   end
#
#   def location_data
#     GeocodingService.new
#   end
#
#   def weather_data
#     DarkSkyService.new.get_weather(@latitude, @longitude)
#   end
#
#   def get_latitude
#     location_data.find_latitude
#   end
#
#   def get_longitude
#     location_data.find_longitude
#   end
#
# end
