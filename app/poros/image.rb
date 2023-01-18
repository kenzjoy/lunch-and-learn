class Image
  attr_reader :alt_tag,
              :url

  def initialize(info)
    @alt_tag = info[:alt_description]
    @url = info[:urls][:raw]
  end
end