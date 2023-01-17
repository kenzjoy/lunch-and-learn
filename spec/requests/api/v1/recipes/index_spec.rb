require 'rails_helper'

RSpec.describe 'recipes index', :vcr do
  it 'returns a json formatted list of recipes from a given country' do
    country = 'brazil'

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    recipes = parsed[:data]

    expect(recipes).to be_an(Array)
    expect(recipes.count).to eq(20)
    expect(recipes.first.keys).to include(
      :id,
      :type,
      :attributes
      )
    expect(recipes.first[:id]).to eq(nil)
    expect(recipes.first[:type]).to eq('recipe')
    expect(recipes.first[:attributes].keys).to include(
      :title,
      :url,
      :country,
      :image
      )
    expect(recipes.first[:attributes][:title]).to be_a(String)
    expect(recipes.first[:attributes][:url]).to be_a(String)
    expect(recipes.first[:attributes][:country]).to be_a(String)
    expect(recipes.first[:attributes][:image]).to be_a(String)

    expect(recipes.first).to_not have_key(:calories)
    expect(recipes.first).to_not have_key(:source)
  end

  it 'returns an empty array if country parameter is an empty string OR the given country doesnt return any recipes' do
    country = ''

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    
    expect(parsed).to be_a(Hash)
    expect(parsed).to have_key(:data)
    expect(parsed).to_not have_key(:id)
    expect(parsed).to_not have_key(:type)
    expect(parsed).to_not have_key(:attributes)
    expect(parsed[:data]).to be_an(Array)
    expect(parsed[:data]).to eq([])
  end

  it 'returns a json formatted list of recipes from a random country if country params are blank' do
    random_country_json = File.read('spec/fixtures/random_country.json')
    stub_request(:get, 'https://restcountries.com/v3.1/all').to_return(status: 200, body: random_country_json)

    get '/api/v1/recipes'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    recipes = parsed[:data]

    expect(recipes).to be_an(Array)
    expect(recipes.first.keys).to include(
      :id,
      :type,
      :attributes
      )
    expect(recipes.first[:id]).to eq(nil)
    expect(recipes.first[:type]).to eq('recipe')
    expect(recipes.first[:attributes].keys).to include(
      :title,
      :url,
      :country,
      :image
      )
    expect(recipes.first[:attributes][:title]).to be_a(String)
    expect(recipes.first[:attributes][:url]).to be_a(String)
    expect(recipes.first[:attributes][:country]).to be_a(String)
    expect(recipes.first[:attributes][:image]).to be_a(String)

    expect(recipes.first).to_not have_key(:calories)
    expect(recipes.first).to_not have_key(:source)
  end
end