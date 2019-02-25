class GifService

  def find_gifs(keyword)
    response = conn.get("/v1/gifs/search?") do |f|
      f.params[:q] = keyword
    end
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.giphy.com') do |f|
      f.params[:key] = ENV['GIPHY_API_KEY']
      f.params[:limit] = 5
      f.adapter Faraday.default_adapter
    end
  end
end
