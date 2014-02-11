PeaPatchPlanner::Application.routes.draw do
  root "welcome#index"

  get "users/new", to: "users#new"




  
end
