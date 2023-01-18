require 'rails_helper'

RSpec.describe 'users create' do
  it 'creates a new user and generates an api key for said user' do
    headers = { "CONTENT_TYPE" => "application/json" }
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