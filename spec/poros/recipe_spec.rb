require 'rails_helper'

RSpec.describe Recipe, :vcr do
  before(:each) do
    recipe_info = {
      recipe: {
        label: "The Prince Of Wales' Cocktail",
        url: 'http://www.sfgate.com/food/recipes/detail.html?rid=16843&sorig=qs',
        image: 'https://edamam-product-images.s3.amazonaws.com/web-img/2fc/2fc337a3d14a2ffa7a9d224883e12cb5.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDsSGrhuMnNYru1nnoYO3YSCCvSrlmvD9ZvVkNFrNQx%2BwIhAJEQc3j0gPDaTgMju57FZShr3t2kWTlBCbFIY053QW5XKswECDkQABoMMTg3MDE3MTUwOTg2IgyD3DqyINT8wdTrMiMqqQT0By2ugRIZy7z8maMoTxGKUNHgUWtwwryilGd9MY2mAnpopSABb5KGLn0vRvTIPJ7zLsNDaj4%2Bfuv%2BoIpTlIdhudY8NyVKk7%2BOS5AWbvb6Z49EWW7sxZZmhErkBABwTX8h3kBD7%2BICaUSyiw70439vG3hUYhnY%2Fc8jLs%2BUcLnwZSonH1s1DKaPSSidDjrj8hL9SW0ooV1Rd5n%2BAqubRE7C6fqfIyEvrFoIIOeAnQ8DMWK3WR%2BY9XJN1vioBaBRzYnz5b6Ia4LeEG4I7MbNXVwpUqw5X1D%2FCOcFYUiSOwA7PnG%2F3Wu6wAkJViTRTMgsEeapBt%2BSXFafRFFmvp1ml4XXXSfy6slw7uHfvr0sZBOz9e5zdmzCkYqlfd9UWLvzFyOdg7htMBmvxeQUtj5vz1Ltjblo50XcaQJJgbwSu%2FW01WtdtUkQ33i%2FWvU%2BIl7cfvHG%2FAtX56coVkAt%2B7TH%2Fe0HejcAFM1sjCViP119s8jmmDSyRpoQ%2BRzw4f4WxQ6dd2B4%2FRN2imjCnUm%2BIO0%2F9Q4944vzFs7ShU3Qnkngt63WcdVOyYG0i4DvtBSHAqFsRjC74xqLZYIa3i2EQr1KGqwR9BESBKSb0KDMbz2VhKQiUSm%2FvYaRxqjiP4lQZKhEqYtteaboR6qQ2riLgELxpLGKK%2BDv4eIhx%2BjNqyhvQgkKGXHjiABw%2BTmq9avMeFPm3HceqY%2B757%2B2%2Fr1jVQUhsDanqfFQocHOjoQEMO%2FBl54GOqgBnTzVxZxUJ0Rpi8vAU6TGxhjwA5vqIaArdABaj6wJ7o2Xg73Ota5QJD9sKFfPL6peGTyp%2BghIFMqOMxzruYqNGu7w2En7YLmbqbq0m%2FEK6JlXdug7V7cRJelRILeUvE66lLAIOEAsWWWCQmsaNO72cZsJKegNsVZceRm6lmyhRn9tEg9SjLHFQFvARNhucEjqIxDOAJh%2Fy3iyhpYlrWKQCKc%2BMSt2AT3y&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230117T004839Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFON4MPE5K%2F20230117%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d4e5ef63f9f3da499dcc9d2f6b71e8baf1f6a5c81138be02b168b78c2ec34204'
      }
    }
    country = 'wales'
    @recipe = Recipe.new(recipe_info, country)
  end

  it 'exists' do
    expect(@recipe).to be_a(Recipe)
  end

  it 'has attributes' do
    expect(@recipe.title).to eq("The Prince Of Wales' Cocktail")
    expect(@recipe.url).to eq('http://www.sfgate.com/food/recipes/detail.html?rid=16843&sorig=qs')
    expect(@recipe.image).to eq('https://edamam-product-images.s3.amazonaws.com/web-img/2fc/2fc337a3d14a2ffa7a9d224883e12cb5.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEND%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDsSGrhuMnNYru1nnoYO3YSCCvSrlmvD9ZvVkNFrNQx%2BwIhAJEQc3j0gPDaTgMju57FZShr3t2kWTlBCbFIY053QW5XKswECDkQABoMMTg3MDE3MTUwOTg2IgyD3DqyINT8wdTrMiMqqQT0By2ugRIZy7z8maMoTxGKUNHgUWtwwryilGd9MY2mAnpopSABb5KGLn0vRvTIPJ7zLsNDaj4%2Bfuv%2BoIpTlIdhudY8NyVKk7%2BOS5AWbvb6Z49EWW7sxZZmhErkBABwTX8h3kBD7%2BICaUSyiw70439vG3hUYhnY%2Fc8jLs%2BUcLnwZSonH1s1DKaPSSidDjrj8hL9SW0ooV1Rd5n%2BAqubRE7C6fqfIyEvrFoIIOeAnQ8DMWK3WR%2BY9XJN1vioBaBRzYnz5b6Ia4LeEG4I7MbNXVwpUqw5X1D%2FCOcFYUiSOwA7PnG%2F3Wu6wAkJViTRTMgsEeapBt%2BSXFafRFFmvp1ml4XXXSfy6slw7uHfvr0sZBOz9e5zdmzCkYqlfd9UWLvzFyOdg7htMBmvxeQUtj5vz1Ltjblo50XcaQJJgbwSu%2FW01WtdtUkQ33i%2FWvU%2BIl7cfvHG%2FAtX56coVkAt%2B7TH%2Fe0HejcAFM1sjCViP119s8jmmDSyRpoQ%2BRzw4f4WxQ6dd2B4%2FRN2imjCnUm%2BIO0%2F9Q4944vzFs7ShU3Qnkngt63WcdVOyYG0i4DvtBSHAqFsRjC74xqLZYIa3i2EQr1KGqwR9BESBKSb0KDMbz2VhKQiUSm%2FvYaRxqjiP4lQZKhEqYtteaboR6qQ2riLgELxpLGKK%2BDv4eIhx%2BjNqyhvQgkKGXHjiABw%2BTmq9avMeFPm3HceqY%2B757%2B2%2Fr1jVQUhsDanqfFQocHOjoQEMO%2FBl54GOqgBnTzVxZxUJ0Rpi8vAU6TGxhjwA5vqIaArdABaj6wJ7o2Xg73Ota5QJD9sKFfPL6peGTyp%2BghIFMqOMxzruYqNGu7w2En7YLmbqbq0m%2FEK6JlXdug7V7cRJelRILeUvE66lLAIOEAsWWWCQmsaNO72cZsJKegNsVZceRm6lmyhRn9tEg9SjLHFQFvARNhucEjqIxDOAJh%2Fy3iyhpYlrWKQCKc%2BMSt2AT3y&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230117T004839Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFON4MPE5K%2F20230117%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d4e5ef63f9f3da499dcc9d2f6b71e8baf1f6a5c81138be02b168b78c2ec34204')
    expect(@recipe.country).to eq('wales')
  end
end