require 'rails_helper'

RSpec.describe Image, :vcr do
  before(:each) do
    info = { 
      alt_tag: 'mountains covered with snow near road',
      urls: { 
        raw: 'https://images.unsplash.com/photo-1531804055935-76f44d7c3621?ixid=Mnw0MDAxOTR8MHwxfHNlYXJjaHwyfHxuZXclMjB6ZWFsYW5kfGVufDB8fHx8MTY3Mzk4NzQyNg&ixlib=rb-4.0.3'
      }
    }
    @image = Image.new(info)
  end

  it 'exists' do
    expect(@image).to be_an(Image)
  end
end