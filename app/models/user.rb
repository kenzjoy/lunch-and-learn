class User < ApplicationRecord
  before_validation :assign_api_key, if: :no_api_key
  validates_presence_of :name, :email, :api_key
  validates_uniqueness_of :email, :api_key

  private

 def assign_api_key
  self.api_key = SecureRandom.hex(15)
 end

 def no_api_key
  self.api_key.nil?
 end
end