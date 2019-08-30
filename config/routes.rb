Rails.application.routes.draw do
  resources :posts
  get "login" , to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout/:id", to: "sessions#destroy", as: "logout"
  resources :users, except: [:index,:new]
  get "signup" ,to: "users#new"
  root "home#index"
end
