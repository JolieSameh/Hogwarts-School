Rails.application.routes.draw do
  resources :wizards
    root 'home#index'
    get 'spells/display'
  
  
    # Defines the root path route ("/")
    # root "articles#index"
  end