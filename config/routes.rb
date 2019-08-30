Rails.application.routes.draw do
  resources :users, except: [:index,:new]
  get "signup" ,to: "users#new"
end
