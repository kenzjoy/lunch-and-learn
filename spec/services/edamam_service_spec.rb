require 'rails_helper'

RSpec.describe EdamamService do
  it 'returns a json response of recipes from a given country' do
    country = 'thailand'
    recipes = EdamamService.get_recipe_search(country)

    expect(recipes[:hits]).to be_an(Array)
    expect(recipes[:hits].count).to eq(20)

    r = recipes[:hits].first

    expect(r.keys).to eq([:recipe, :_links])
    expect(r[:recipe].keys).to include(
      :uri,
      :label,
      :image,
      :images,
      :source,
      :url,
      :shareAs,
      :yield,
      :dietLabels,
      :healthLabels,
      :cautions,
      :ingredientLines,
      :ingredients,
      :calories,
      :totalWeight,
      :totalTime,
      :cuisineType,
      :mealType,
      :dishType,
      :totalNutrients,
      :totalDaily,
      :digest
      )

    expect(r[:_links][:self].keys).to include(
      :href,
      :title
      )

    expect(r[:recipe][:label]).to be_a(String)
    expect(r[:recipe][:url]).to be_a(String)
    expect(r[:recipe][:image]).to be_a(String)
    expect(r[:recipe][:images]).to be_a(Hash)
  end
end