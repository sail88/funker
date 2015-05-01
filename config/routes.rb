Rails.application.routes.draw do

  root to: "funks#index"

  resources :funks
end
