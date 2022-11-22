Rails.application.routes.draw do
  devise_for :users
  resources :spells
  resources :users

  resources :wizards
  resources :relationships

  root 'home#index'
  get 'spells/display'
  get 'wizards/display'
  
  delete 'users/:id', to: "users#delete_user", as: "delete_user"
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  
  get 'password/resets', to: "password_resets#new"
  post 'password/resets', to: "password_resets#create"
  get 'password/resets/edit', to: "password_resets#edit"
  patch 'password/resets/edit', to: "password_resets#update"

  get 'welcome/emails', to: "welcome_emails#new"
  post 'welcome/emails', to: "welcome_emails#create"
  
  # Defines the root path route ("/")
  # root "articles#index"
  end