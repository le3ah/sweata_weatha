class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :latitude, :longitude, :city, :state

  attribute :currently do |object|
    object.current_weather
  end
  attribute :daily do |object|
    object.daily_weather
  end
  attribute :hourly do |object|
    object.hourly_weather
  end
end
