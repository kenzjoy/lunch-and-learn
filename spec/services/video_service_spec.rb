require 'rails_helper'

RSpec.describe VideoService, :vcr do
  it 'returns a json response with a video from the Mr. History channel about a given country' do
    country = 'egypt'
    videos = VideoService.get_video(country)

    expect(videos).to be_a(Hash)
    expect(videos).to have_key(:items)

    video = videos[:items].first

    expect(video).to have_key(:id)
    expect(video[:id]).to have_key(:videoId)
    expect(video[:id][:videoId]).to be_a(String)
    expect(video).to have_key(:snippet)
    expect(video[:snippet]).to have_key(:title)
    expect(video[:snippet][:title]).to be_a(String)
  end

  it 'returns an empty array if search params do not return a video' do
    country = 'phish'
    videos = VideoService.get_video(country)

    expect(videos[:items]).to eq([])
  end
end