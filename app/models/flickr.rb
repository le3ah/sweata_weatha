class Flickr
  attr_reader :farm_id, :server_id, :id, :secret
  def initialize(attributes)
    @farm_id = attributes[:farm]
    @server_id = attributes[:server]
    @id = attributes[:id]
    @secret = attributes[:secret]
    @title = attributes[:title]
    @background_url = background_url
  end

  def background_url
    "https://farm#{@farm_id}.staticflickr.com/#{@server_id}/#{@id}_#{@secret}.jpg"
  end
end
