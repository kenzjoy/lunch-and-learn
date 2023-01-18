class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: { error: 'API key does not belong to a user.' }, status: 404
    elsif 
      favorite = Favorite.new(favorite_params)
      favorite.user_id = user.id
      favorite.save
      render json: { message: 'Recipe has been added to favorites.' }, status: 201
    end
    # require 'pry'; binding.pry
  end

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end