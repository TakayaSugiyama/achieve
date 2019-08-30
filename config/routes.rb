Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  get 'sessions/new'
  resources :users, except: [:index,:new]
  get "signup" ,to: "users#new"
  root "home#index"
end
