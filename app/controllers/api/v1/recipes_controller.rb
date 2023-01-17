class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      recipes = EdamamFacade.recipe_search(params[:country])
    else
      country = CountryFacade.random_country
      recipes = EdamamFacade.recipe_search(country.name)
    end
    render json: RecipeSerializer.new(recipes)
  end
end