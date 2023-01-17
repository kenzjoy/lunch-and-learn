require 'rails_helper'

RSpec.describe CountryService, :vcr do
  it 'returns a json response of info about countries' do
    countries = CountryService.all_countries
    country = countries.first

    expect(countries).to be_an(Array)
    expect(country).to be_a(Hash)
    expect(country).to have_key(:name)
    expect(country[:name]).to have_key(:common)
    expect(country[:name][:common]).to be_a(String)
  end
end