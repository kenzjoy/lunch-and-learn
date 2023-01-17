class VideoService
  def self.conn
    Faraday.new(url: "https://www.googleapis.com") do |f|
      f.params['key'] = ENV['youtube_api_key']
    end
  end

  def self.get_video(country)
    response = conn.get('/youtube/v3/search') do |search|
      search.params['part'] = 'snippet'
      search.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      search.params['maxResults'] = 1
      search.params['type'] = 'video'
      search.params['q'] = country
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end