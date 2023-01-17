require 'rails_helper'

RSpec.describe Recipe, :vcr do
  before(:each) do
    recipe_info = {
      recipe: {
        label: 'chicken noodle soup',
        url: 'www.panerabread.com', 
        image: 'www.myspace.com'
      }
    }
    country = 'canada'
    @recipe = Recipe.new(recipe_info, country)
  end

  it 'exists' do
    expect(@recipe).to be_a(Recipe)
  end

  it 'has attributes' do
    expect(@recipe.title).to eq('chicken noodle soup')
    expect(@recipe.url).to eq('www.panerabread.com')
    expect(@recipe.image).to eq('www.myspace.com')
    expect(@recipe.country).to eq('canada')
  end
end