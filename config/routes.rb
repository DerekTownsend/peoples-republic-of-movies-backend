Rails.application.routes.draw do
  resources :comments
  resources :likes
  resources :favorites
  resources :ratings
  resources :genre_movies
  resources :actor_movies
  resources :genres
  resources :actors
  resources :movies
  namespace :api do
      namespace :v1 do
        resources :users, only: [:create]
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
      end
    end
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
