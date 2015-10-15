Rails.application.routes.draw do
  resources :users
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#auth_failure'
  resources :items, path: :items
  get "/library/:id", to: "items#index", defaults: {format: :json}
  resources :items,  path: :library, defaults: {format: :json}, :except => :show
  root to: 'application#index'
end
