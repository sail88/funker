Rails.application.routes.draw do

  root to: "users#index"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  delete "/logout", to: "sessions#destroy" # this should not in fact be a GET verb, but this is the easy way for now

  resources :users do
	  resources :funks
  end
end
