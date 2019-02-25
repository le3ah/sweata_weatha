class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :title, :background_url
end
