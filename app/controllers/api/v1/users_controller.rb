class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: { error: 'Email is already registered.' }, status: 400
    end
  end

  private

  def user_params
    params.permit(:name, :email, :api_key)
  end
end