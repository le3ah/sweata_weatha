class Api::V1::GifsController < ApplicationController
  def index
    def self.find_gifs(keyword)
      conn = Faraday.new('https://api.giphy.com') do |f|
        f.params[:key] = ENV['flickr_api_key']
        f.params[:q] = keyword
        f.params[:limit] = 5
        f.adapter Faraday.default_adapter
      end
      response = conn.get("/v1/gifs/search?")
      JSON.parse(response.body, symbolize_names: true)

    end



    # render json: Gif.new(params[:location])
  end
end
