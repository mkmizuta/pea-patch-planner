require 'resque/server'

PeaPatchPlanner::Application.routes.draw do

  mount Resque::Server, :at => "/resque"

  root "welcome#index"
  resources :blogposts
 

  get  "users/new",    to: "users#new"
  post "users/create", to: "users#create"
  # get "users/show",  to: "users#show", as: :user
  get  "users/:id",    to: "users#show", as: :user
  get  "users/edit",   to: "users#edit"


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

