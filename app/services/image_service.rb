class ImageService
  def self.conn
    Faraday.new(url: "https://api.unsplash.com") do |f|
      f.params['client_id'] = ENV['unsplash_access_key']
    end
  end

  def self.get_photos(country)
    response = conn.get('search/photos') do |search|
      search.params['query'] = country
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end