require 'rails_helper'

RSpec.describe 'users create' do
  it 'creates a new user and generates an api key for said user' do
    headers = { "CONTENT_TYPE" => "application/json" }
    user_params = {
      'name': 'uncle ebenezer',
      'email': 'tweezer@badboyfreecat.com'
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
require 'pry'; binding.pry
    expect(response).to be_successful
    expect(response.status).to eq(201)
  end
end