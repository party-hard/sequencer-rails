Rails.application.routes.draw do

  # Auth
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider', to: 'sessions#create', as: 'login'
  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'
  get '/auth/failure', to: 'sessions#auth_failure'

  # Items
  resources :items, path: :items,  defaults: {format: :json}, except: [:edit, :new]

  # Users
  get 'users/current', to: 'users#current', defaults: {format: :json}
  resources :users, defaults: {format: :json}, only: [:show]

  # Debug-devepopment views
  if Rails.env.development?
    resources :items, path: :items_test
    resources :users, path: :users_test
  end

  root to: 'application#index'
  match '*all', to: 'application#index', via: [:get]

end
