Rails.application.routes.draw do
  devise_for :users
  resources :spells
  resources :wizards
  # resource :relationships

    root 'home#index'
    get 'spells/display'
    get 'wizards/display'

    # post '/users/:id/follow', to: "users#follow", as: "follow_user"
    # post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  # resources :users do
  #   resources :relationships, only: [:create]
  # end

  #   resources :relationships, only: [:destroy]

    # Defines the root path route ("/")
    # root "articles#index"
  end