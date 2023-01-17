require 'rails_helper'

RSpec.describe ImageFacade, :vcr do
  describe '#get_images(country)' do
    it 'returns an array of image objects from a given country' do
      country = 'new zealand'
      images = ImageFacade.get_images(country)

      expect(images).to be_an(Array)
      expect(images.count).to eq(10)

      image = images.first
      
      expect(image).to be_an(Image)
      expect(image.alt_tag).to be_a(String)
      expect(image.url).to be_a(String)
    end
  end
end