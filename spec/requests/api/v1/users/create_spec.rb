require 'rails_helper'

RSpec.describe 'users create' do
  describe 'when required params are given' do
    it 'creates a new user and generates an api key for said user' do
      headers = { "Content-Type": "application/json", Accept: "application/json" }
      body = JSON.generate(
        'name': 'uncle ebenezer',
        'email': 'tweezer@badboyfreecat.com'
      )

      post '/api/v1/users', headers: headers, params: body

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:type]).to eq('user')
      expect(parsed[:data][:attributes].keys).to include(
        :name,
        :email,
        :api_key
      )
    end
  end

  describe 'when there are missing user params' do
    it 'returns an error message' do
      headers = { "CONTENT_TYPE" => "application/json" }
      body = JSON.generate(
        'name': 'mike gordon'
      )

      post '/api/v1/users', headers: headers, params: body

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:error]).to eq('Please try again.')
    end
  end
end