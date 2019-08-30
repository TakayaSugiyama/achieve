Rails.application.routes.draw do
  get "login" , to: "sessions#new"
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"
  resources :users, except: [:index,:new]
  get "signup" ,to: "users#new"
  root "home#index"
end
