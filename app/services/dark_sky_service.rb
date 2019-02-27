class DarkSkyService

  def get_weather(lat, long)
    Rails.cache.fetch("weather_info_#{lat}_#{long}", expires_in: 1.hour) do
      response = conn.get("/forecast/#{ENV["darksky_api_secret"]}/#{lat},#{long}")
      JSON.parse(response.body, symbolize_names: true)
    end 
  end

  private

  def conn
    Faraday.new(url: "https://api.darksky.net") do |f|
      f.params[:exclude] = 'minutely'
      f.adapter Faraday.default_adapter
    end
  end
end
