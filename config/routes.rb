Rails.application.routes.draw do
  root to: 'toppages#index'

  get '/auth/:provider/callback', to:'sessions#twitter_create'
  get 'rankings/like', to:'rankings#like'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :tests, only:[:new,:create]
  resources :comments, only:[:create,:destroy,:new]
  resources :users, only: [:show, :new, :create]
  resources :restaurants, only: [:show, :new]
  resources :likes, only:[:create, :destroy]
  resources :charges, only: [:new,:create]
  resources :relationships,only: [:create,:destroy]
end
