class GifSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :time, :summary, :url
end
