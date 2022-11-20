Rails.application.routes.draw do
  devise_for :users
  resources :spells
  resources :users
  resources :wizards
  resources :relationships

  root 'home#index'
  get 'spells/display'
  get 'wizards/display'

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  

    # Defines the root path route ("/")
    # root "articles#index"
  end