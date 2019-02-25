class Api::V1::GifsController < ApplicationController
  def index
    gif = GifFacade.new(params[:location])
    # binding.pry
    render json: GifSerializer.new(gif.get_gif_url)
  end
end
