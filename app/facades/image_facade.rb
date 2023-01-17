class ImageFacade
  def self.get_images(country)
    images = ImageService.get_photos(country)
    images[:results].map do |info|
      Image.new(info)
    end
  end
end