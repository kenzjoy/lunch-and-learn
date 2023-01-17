require 'rails_helper'

RSpec.describe ImageService, :vcr do
  it 'returns a json response with images related to the country given in the search query' do
    country = 'sweden'
    photos = ImageService.get_photos(country)

    expect(photos).to be_a(Hash)
    expect(photos).to have_key(:results)

    photo = photos[:results].first

    expect(photo).to have_key(:alt_description)
    expect(photo[:alt_description]).to be_a(String)
    expect(photo).to have_key(:urls)
    expect(photo[:urls].keys).to include(
      :raw,
      :full,
      :regular,
      :small,
      :thumb, 
      :small_s3
    )
    expect(photo[:urls][:regular]).to be_a(String)
  end

  it 'returns an empty array if search params do not return an image' do
    country = 'phish'
    photos = ImageService.get_photos(country)

    expect(photos[:results]).to eq([])
  end
end