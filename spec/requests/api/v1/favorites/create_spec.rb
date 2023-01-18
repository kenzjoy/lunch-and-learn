require 'rails_helper'

RSpec.describe 'favorites create' do
  describe 'when user api key is valid' do
    it 'adds to that users list of favorite recipes' do
      headers = { 'CONTENT_TYPE' => 'application/json' }
      user = User.create!(
        name: 'jelly bean',
        email: 'jellybelly@badboysforlife.com'
      )
      favorite_params = ( {
        api_key: user.api_key,
        country: 'peru',
        recipe_link: 'https://www.tastingtable.com/.....',
        recipe_title: 'yummy peruvian chickies'
      } )

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)
      
      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
    end
  end
end