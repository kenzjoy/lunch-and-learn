class EdamamFacade
  def self.recipe_search(country)
    country_recipes = EdamamService.get_recipe_search(country)
  end
end