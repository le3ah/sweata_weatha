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
        render json: FavoriteSerializer.new(user)
      else
        render json: "You have no favorite locations", status: :unauthorized
      end
    end
  end

  def destroy
    if params[:api_key]
      user = User.find_by(api_key: params[:api_key])
      if user && user.favorites
        favorite = user.favorites.find_by(location: params[:location])
        favorite.destroy
        render json: favorite
      else
        render json: "Something went wrong", status: :unauthorized
      end
    end
  end
end
