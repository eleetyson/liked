Rails.application.routes.draw do
  root 'users#home'

  get '/auth/twitter/callback' => 'sessions#create'
  get '/auth/failure' => '/'
  post '/logout' => 'sessions#destroy'

  resources :users, only: [:show]
  # resources :follows
  # resources :likes
end
