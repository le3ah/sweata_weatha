class Api::V1::GifsController < ApplicationController
  def index
    gif = GifFacade.new(params[:location])
    render json: GifSerializer.new(gif.get_gif_url)
    # render json: Gif.all
  end
end
