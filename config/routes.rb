Rails.application.routes.draw do
  devise_for :users
  resources :spells
  resources :wizards
    root 'home#index'
    get 'spells/display'
  
  
    # Defines the root path route ("/")
    # root "articles#index"
  end