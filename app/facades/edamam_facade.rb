class EdamamFacade
  def self.recipe_search(country)
    country_recipes = EdamamService.get_recipe_search(country)
    country_recipes[:hits].map do |recipe_info|
      Recipe.new(recipe_info, country)
    end
  end
end