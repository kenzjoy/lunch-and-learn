require 'rails_helper'

RSpec.describe 'learning resources index', :vcr do
  it 'returns a json formatted list of learning resources for a given country' do
    country = 'lebanon'

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    learning_resources = parsed[:data]

    expect(learning_resources).to be_a(Hash)
    expect(learning_resources.keys).to include(
      :id,
      :type,
      :attributes
    )
    expect(learning_resources[:id]).to eq(nil)
    expect(learning_resources[:type]).to eq('learning_resources')
    expect(learning_resources[:attributes].keys).to include(
      :country,
      :video,
      :images
    )
    expect(learning_resources[:attributes][:country]).to be_a(String)
    expect(learning_resources[:attributes][:video]).to be_an(Array)
    expect(learning_resources[:attributes][:images]).to be_an(Array)
    expect(learning_resources).to_not have_key(:audioBook)
  end

  it 'returns an empty array for video and images if no results match the search query' do
    country = 'phish'

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    learning_resources = parsed[:data]

    expect(learning_resources).to be_a(Hash)
    expect(learning_resources.keys).to include(
      :id,
      :type,
      :attributes
    )
    expect(learning_resources[:id]).to eq(nil)
    expect(learning_resources[:type]).to eq('learning_resources')
    expect(learning_resources[:attributes].keys).to include(
      :country,
      :video,
      :images
    )
    expect(learning_resources[:attributes][:country]).to eq(country)
    expect(learning_resources[:attributes][:video]).to eq([])
    expect(learning_resources[:attributes][:images]).to eq([])
    expect(learning_resources).to_not have_key(:audioBook)
  end
end