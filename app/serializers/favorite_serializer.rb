class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id

  attribute :favorites do |object|
    object.favorites.map do |fave|
      location_details(fave.location)
    end
  end

  private

  def self.location_details(location)
    favorites = {}
    favorites[:location] = location
    favorites[:current_weather] = ForecastFacade.new(location).get_forecast.currently
    favorites
  end
end
