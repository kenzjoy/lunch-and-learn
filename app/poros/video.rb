class Video
  attr_reader :country,
              :title,
              :youtube_video_id

  def initialize(info, country)
    @country = country
    @title = info[:snippet][:title]
    # @title = info[:title]
    @youtube_video_id = info[:id][:videoId]
  end
end