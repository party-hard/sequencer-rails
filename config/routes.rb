Rails.application.routes.draw do

  # Users
  get 'users/current', to: 'users#current', defaults: {format: :json}
  # resources :users, path: :users_test
  resources :users, defaults: {format: :json}

  # Auth
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider', to: 'sessions#create', as: 'login'
  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'
  get '/auth/failure', to: 'sessions#auth_failure'

  # Items|Library
  # resources :items, path: :items_test
  resources :items, path: :items,  defaults: {format: :json}

  root to: 'application#index'
  match '*all', to: 'application#index', via: [:get]
end
