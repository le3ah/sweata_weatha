class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.new(params[:location])
    render json: BackgroundSerializer.new(background.get_background_url)
  end
end
