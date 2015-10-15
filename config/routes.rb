Rails.application.routes.draw do
  resources :users, param: :uid
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#auth_failure'
  resources :items, path: :items, param: :uid
  resources :items,  path: :library, param: :uid, defaults: {format: :json}
  root to: 'application#index'
end
