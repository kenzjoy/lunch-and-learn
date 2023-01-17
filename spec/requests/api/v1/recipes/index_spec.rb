require 'rails_helper'

RSpec.describe 'recipes index', :vcr do
  it 'returns a json formatted list of recipes from a given country' do
    country = 'brazil'

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    recipes = parsed[:data]

    require 'pry'; binding.pry
  end
end