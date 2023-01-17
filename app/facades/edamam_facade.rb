class EdamamFacade
  def self.recipe_search(country)
    country_recipes = EdamamService.get_recipe_search(country)
    array = country_recipes[:hits]
  end
end