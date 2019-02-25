class Flickr
  attr_reader :farm_id, :server_id, :id, :secret
  def initialize(attributes)
    @farm_id = attributes[:farm]
    @server_id = attributes[:server]
    @id = attributes[:id]
    @secret = attributes[:secret]
    @title = attributes[:title]
  end
end
