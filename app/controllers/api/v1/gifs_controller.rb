class Api::V1::GifsController < ApplicationController
  def index
    gif = GifFacade.new(params[:location])
    render json: GifSerializer.new(gif.gif_daily_data)
  end
end
