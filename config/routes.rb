Rails.application.routes.draw do
  root 'users#home'
  
  get '/auth/twitter/callback' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # resources :users
  # resources :follows
  # resources :likes
end
