Rails.application.routes.draw do
  resources :spells
  resources :wizards
    root 'home#index'
    get 'spells/display'
  
  
    # Defines the root path route ("/")
    # root "articles#index"
  end