require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :api_key }
    it { should validate_uniqueness_of :email }
  end

  describe 'assign_api_key' do
    it 'assigns each new user a unique api key when they register' do
      bird = User.create(
        name: 'bird',
        email: 'bellabird@bestgirlever.com'
      )

      expect(bird.api_key).to_not be_nil
    end
  end
end