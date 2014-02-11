PeaPatchPlanner::Application.routes.draw do

  root "welcome#index"

  get "users/new", to: "users#new"

  get '/signin',     to: 'sessions#new', as: :signin
  post '/signin',    to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: :signout

end
