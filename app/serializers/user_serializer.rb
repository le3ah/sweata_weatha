class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :api_key
end
