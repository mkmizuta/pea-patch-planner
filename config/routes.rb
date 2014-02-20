PeaPatchPlanner::Application.routes.draw do

 
  root "welcome#index"
  resources :blogposts, :tools, :events

  get 'users/email', to: 'users#email', as: :user_email
  post 'users/save_email', to: 'users#create'
  patch 'users/', to: 'users#update'
  get "users/edit", to: "users#edit"
  get "users/", to: "users#show", as: :user
  

  get '/signout', to: 'sessions#destroy', as: :signout 
  get '/twitter/signout', to: 'twitter#signout'
  
  post '/welcome', to: 'weather#create'

  match 'auth/twitter/callback', to: 'twitter#create', via: [:get, :post]


end
