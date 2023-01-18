class LearningResourcesSerializer
  def self.learning_resources(country, video, images)
    if country != nil
      {
        data: {
          id: nil, 
          type: 'learning_resources',
          attributes: {
            country: country,
            video: 
              video.map do |v|
                { title: v.title,
                  youtube_video_id: v.youtube_video_id
                }
              end,
            images:
              images.map do |i|
                { alt_tag: i.alt_tag,
                  url: i.url
                }
              end
          }
        }
      }
    else

    end
  end
end