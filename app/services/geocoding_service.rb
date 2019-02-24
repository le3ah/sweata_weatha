class GeocodingService
  def initialize(city, state)
    @city = city
    @state = state
  end

  def find_coordinates
    get_json("/maps/api/geocode/json")[:results]
    .first[:geometry][:location]
  end

  def find_latitude
    find_coordinates[:lat]
  end

  def find_longitude
    find_coordinates[:lng]
  end

  private

  def get_json(url)
    response = conn.get(url) do |f|
      f.params[:address] = "#{@city},#{@state}"
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
