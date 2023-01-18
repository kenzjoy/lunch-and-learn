class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.present?
      favorite = user.favorites.new(favorite_params)
      favorite.save
      render json: { 'success': 'Favorite added successfully.' }, status: 201
    else
      render json: { 'error': 'API key does not belong to a user.' }, status: 400
    end
  end

  def index
    if params[:api_key].present?
      user = User.find_by(api_key: params[:api_key])
      if !user.present?
        render json: { 'error': 'No user found, please try again.' }, status: 400
      else
        favorites = user.favorites
        render json: FavoriteSerializer.new(favorites), status: 200
      end
    end
  end

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title, :api_key)
  end
end