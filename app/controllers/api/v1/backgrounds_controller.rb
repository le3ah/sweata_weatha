class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: Background.new(params[:location])
  end
end
