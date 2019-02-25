class Api::V1::GifsController < ApplicationController
  def index
    render json: Gif.new(params[:location])
  end
end
