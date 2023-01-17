require 'rails_helper'

RSpec.describe Video, :vcr do
  before(:each) do
    country = 'new zealand'
    info = {
      snippet: { title: 'A Super Quick History of New Zealand' },
      id: { youtube_video_id: 'm6pVgnWaGsk' }
    }
    @video = Video.new(info, country)
  end

  it 'exists' do
    expect(@video).to be_a(Video)

  end
end