class VideoFacade
  def self.get_video(country)
    video = VideoService.get_video(country)
    video[:items].map do |info|
      Video.new(info, country)
    end
  end
end