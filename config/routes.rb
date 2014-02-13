PeaPatchPlanner::Application.routes.draw do

  root "welcome#index"
  # resources :users, only: [:new, :create, :edit, :show]

  get "users/new", to: "users#new"
  post "users/create", to: "users#create"
  get "users/show", to: "users#show", as: :user
  get "users/edit", to: "users#edit"


  get '/signin',     to: 'sessions#new', as: :signin
  post '/signin',    to: 'sessions#create'
  # , as: :signin
  get '/signout', to: 'sessions#destroy', as: :signout 
  get 'signup', to: 'users#new'
  post '/welcome', to: 'weather#create'

  # match "/auth/twitter/callback", to: "sessions#create", via: [:get, :post]
end
