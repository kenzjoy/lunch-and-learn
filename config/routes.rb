Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index]
      resources :learning_resources, only: [:index]
      resources :users, only: [:create]

      # post '/favorites', to: 'favorites#update'
      # get '/learning_resources', to: 'learning_resources#show'
      # post '/users', to: 'users#update'

    end
  end
end
