Rails.application.routes.draw do
  resources :users
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#auth_failure'
  resources :items, path: :library, defaults: {format: :json}
  resources :items
  root to: 'application#index'
end
