class Api::V1::RecipesController < ApplicationController

  def index
    recipes = EdamamFacade.recipe_search(params[:country])

    render json: RecipeSerializer.new(recipes)
  end

  # private

  # def country_params
  #   params.permit(:country)
  # end
end