class Favorite < ApplicationRecord
  validates_presence_of :api_key, :country, :recipe_link, :recipe_title

  belongs_to :user
end