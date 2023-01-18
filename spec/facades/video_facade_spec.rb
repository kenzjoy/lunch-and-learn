require 'rails_helper'

RSpec.describe VideoFacade, :vcr do
  describe '#get_video(country)' do
  it 'returns a video objects from a given country' do
    country = 'new zealand'
    video = VideoFacade.get_video(country)

    expect(video).to be_an(Array)
    expect(video.first.title).to be_a(String)
    expect(video.first.youtube_video_id).to be_a(String)
  end
end

end