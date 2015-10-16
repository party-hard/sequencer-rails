Rails.application.routes.draw do

  # Users
  get 'users/current', to: 'users#current', defaults: {format: :json}
  resources :users

  # Auth
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#auth_failure'

  # Items|Library
  resources :items, path: :items
  get '/catalogue', to: 'items#catalogue', defaults: {format: :json}
  get '/library/:id', to: 'items#index', defaults: {format: :json}
  resources :items,  path: :library, defaults: {format: :json}, :except => :show

  root to: 'application#index'
  match '*all', to: 'application#index', via: [:get]
end
