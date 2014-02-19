require 'resque/server'

PeaPatchPlanner::Application.routes.draw do

  mount Resque::Server, :at => "/resque"

  root "welcome#index"
  resources :blogposts, :tools

  # get "blogposts/show", to: "blogposts#show", as: :blogposts
  # resources :users, only: [:new, :create, :edit, :show]

    get "users/new", to: "users#new"
  post "users/create", to: "users#create"
  get 'users/email', to: 'users#email', as: :user_email
  post 'users/save_email', to: 'users#create'
  patch 'users/', to: 'users#update'
  get "users/edit", to: "users#edit"
  # get "users/show", to: "users#show", as: :user
  get "users/", to: "users#show", as: :user
  
# remove users create controller specs 
# go through each spec to see if valid or if not using

  get  '/signin',      to: 'sessions#new',  as: :signin
  post '/signin',      to: 'sessions#create'
  # , as: :signin
  get  '/signout',         to: 'sessions#destroy',  as: :signout 
  get  '/twitter/signout', to: 'twitter#signout'
  get  'signup',           to: 'users#new'
  post '/welcome',         to: 'weather#create'

  #match "/auth/twitter/callback", to: "sessions#create", via: [:get, :post]
  match 'auth/twitter/callback', to: 'twitter#create', via: [:get, :post]


  # get "/auth/twitter", to: "sessions#create"
  # get "auth/twitter", to: "sessions#create"
end

