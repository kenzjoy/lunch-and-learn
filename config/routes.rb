Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post '/favorites', to: 'favorites#update'
      get '/recipes', to: 'recipes#index'
      get '/learning_resources', to: 'learning_resources#show'
      # or get '/learning_resources/country/:id', to: 'learning_resources#show' ??
      post '/users', to: 'users#update'

    end
  end
end
