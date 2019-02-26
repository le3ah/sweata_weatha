class Api::V1::FavoritesController < ApplicationController
  def create
    if params[:api_key]
      user = User.find_by(api_key: params[:api_key])
      user.favorites.create(location: params[:location])
    else
      render json: "You're not welcome here", status: :unauthorized
    end
  end

  def index
    if params[:api_key]
      user = User.find_by(api_key: params[:api_key])
      if user && user.favorites
        render json: user.favorites
      else
        render json: "You have no favorite locations", status: :unauthorized
      end
    else
      render json: "You're not welcome here", status: :unauthorized
    end
  end
end
