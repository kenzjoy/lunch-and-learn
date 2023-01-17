require 'rails_helper'

RSpec.describe CountryFacade, :vcr do
  describe '#country_details' do
    it 'returns a list of countries by name' do
      details = CountryFacade.country_details

      expect(details).to be_an(Array)
    end
  end

  describe '#random_country' do
    it 'returns a random country by name' do

    end
  end
end

