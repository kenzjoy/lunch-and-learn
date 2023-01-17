require 'rails_helper'

RSpec.describe Video, :vcr do
  before(:each) do
    country = 'new zealand'
    info = {
      snippet: { title: 'A Super Quick History of New Zealand' },
      id: { videoId: 'm6pVgnWaGsk' }
    }
    @video = Video.new(info, country)
  end

  it 'exists' do
    expect(@video).to be_a(Video)
  end

  it 'has attributes' do
    expect(@video.country).to eq('new zealand')
    expect(@video.title).to eq('A Super Quick History of New Zealand')
    expect(@video.youtube_video_id).to eq('m6pVgnWaGsk')
  end
end