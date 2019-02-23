class GeocodingService
  def initialize(location)
    @location = location
  end

  def find_coordinates
    get_json("/maps/api/geocode/json")
  end

  def find_latitude
    find_coordinates[:results]
    .first[:geometry][:location][:lat]
  end

  def find_longitude
    find_coordinates[:results]
    .first[:geometry][:location][:lng]
  end

  private

  def get_json(url)
    response = conn.get(url) do |f|
      f.params[:address] = "#{@location.city},#{@location.state}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com') do |faraday|
      faraday.params[:key] = ENV['google_maps_api_key']
      faraday.adapter Faraday.default_adapter
    end
  end
end
