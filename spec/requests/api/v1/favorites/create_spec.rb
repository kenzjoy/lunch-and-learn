require 'rails_helper'

RSpec.describe 'favorites create' do
  before(:each) do
    headers = { "Content-Type": "application/json", Accept: "application/json" }
    body = User.create!(
      name: 'jelly bean',
      email: 'jellybelly@badboysforlife.com'
      )
    @user = User.last
  end

  describe 'when user api key is valid' do
    it 'adds to that users list of favorite recipes' do
      headers = { "Content-Type": "application/json", Accept: "application/json" }
      body = ( {
        "api_key": "#{@user.api_key}",
        "country": "Azerbaijan",
        "recipe_link": "https://food52.com/recipes/74424-lavash-chicken-herb-pie-with-barberries",
        "recipe_title": "Lavash, Chicken & Herb Pie with Barberries"
      } )

      post '/api/v1/favorites', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:success)
      expect(parsed[:success]).to eq('Favorite added successfully.')
    end
  end
end