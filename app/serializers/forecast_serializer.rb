class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :latitude, :longitude, :city, :state
end
