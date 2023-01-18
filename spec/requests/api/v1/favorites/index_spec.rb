require 'rails_helper'

RSpec.describe 'favorites index' do
  before(:each) do
    headers = { "Content-Type": "application/json", Accept: "application/json" }
    body = User.create!(
      name: 'jelly bean',
      email: 'jellybelly@badboysforlife.com'
      )
    @user = User.last
  end

  it 'returns a list of a users favorite recipes' do
    headers = { "Content-Type": "application/json", Accept: "application/json" }
    body = ( {
      "api_key": "#{@user.api_key}",
      "country": "Azerbaijan",
      "recipe_link": "https://food52.com/recipes/74424-lavash-chicken-herb-pie-with-barberries",
      "recipe_title": "Lavash, Chicken & Herb Pie with Barberries"
    } )

    post '/api/v1/favorites', headers: headers, params: JSON.generate(body)

    user_params = { "api_key": "#{@user.api_key}" }
    get "/api/v1/favorites?api_key=#{@user.api_key}", headers: headers, params: user_params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_an(Array)
  end

  it 'returns an empty array if user does not have any saved recipes' do
    headers = { "Content-Type": "application/json", Accept: "application/json" }
    body = ( {
      "api_key": "#{@user.api_key}",
      "country": "Azerbaijan",
      "recipe_link": "https://food52.com/recipes/74424-lavash-chicken-herb-pie-with-barberries",
      "recipe_title": "Lavash, Chicken & Herb Pie with Barberries"
    } )

    user_params = { "api_key": "#{@user.api_key}" }
    get '/api/v1/favorites', headers: headers, params: user_params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_an(Array)
    expect(parsed[:data]).to eq([])
  end
end