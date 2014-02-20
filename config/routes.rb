require 'resque/server'

PeaPatchPlanner::Application.routes.draw do

  mount Resque::Server, :at => "/resque"

  root "welcome#index"
  resources :blogposts, :tools, :events

  get 'users/email', to: 'users#email', as: :user_email
  post 'users/save_email', to: 'users#create'
  patch 'users/', to: 'users#update'
  get "users/edit", to: "users#edit"
  get "users/", to: "users#show", as: :user
  get "users/index", to: "users#index"
  patch 'update_user/', to: 'users#update_user'
  
  get  '/signin',      to: 'sessions#new',  as: :signin
  post '/signin',      to: 'sessions#create'
  # , as: :signin
  get  '/signout',         to: 'sessions#destroy',  as: :signout 
  get  '/twitter/signout', to: 'twitter#signout'
  post '/welcome',         to: 'weather#create'

  match 'auth/twitter/callback', to: 'twitter#create', via: [:get, :post]


end
