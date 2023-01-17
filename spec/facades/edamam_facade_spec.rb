require 'rails_helper'

RSpec.describe EdamamFacade, :vcr do
  describe '#recipe_search(country)' do
    it 'returns a list of recipes from the given country' do
      country = 'wales'
      recipes = EdamamFacade.recipe_search(country)

      expect(recipes).to be_an(Array)
      expect(recipes.count).to eq(20)

      recipe = recipes.first
      
      expect(recipe).to be_a(Recipe)
    end
  end
end
