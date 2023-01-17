class EdamamService

  def self.conn
    Faraday.new(url: 'https://api.edamam.com') do |f|
      f.params['app_id'] = ENV['edamam_app_key']
      f.params['app_key'] = ENV['edamam_api_key']
    end
  end

  def self.get_recipe_search(country)
    response = conn.get('/api/recipes/v2?type=public') do |search|
      search.params['q'] = country
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end