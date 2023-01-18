require 'rails_helper'

RSpec.describe Country, :vcr do
  before(:each) do
    info = { name: {common: 'peru'} }
    @country = Country.new(info)
  end

  it 'exists' do
    expect(@country).to be_a(Country)
  end

  it 'has attribues' do
    expect(@country.name).to eq('peru')
  end
end