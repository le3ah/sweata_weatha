class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      @user.api_key = SecureRandom.hex(10)
      @user.save
      render json: UserSerializer.new(@user)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
