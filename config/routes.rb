Rails.application.routes.draw do

  get 'followers/new'

  get 'followers/create'

  root to: "sessions#start"

  get "/position", to: "sessions#find"

  get "/welcome", to: "sessions#welcome"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  delete "/logout", to: "sessions#destroy" # this should not in fact be a GET verb, but this is the easy way for now

  get "/users/:user_id/followers/new", to: "followers#new"

  post "/users/:user_id/followers", to: "followers#create"

  resources :users do
	  resources :funks
  end
end
