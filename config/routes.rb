Rails.application.routes.draw do

  root to: "creatures#index"

  resources :creatures, only: [:index, :show]
  resources :types, only: [:show]  
  resources :carts, only: [:create]
  resources :users, only: [:new, :create, :show]
  resources :orders, only: [:index, :create]
  
  namespace :admin do
    resources :dashboard, only: [:index]
  end
  
  post "/login", to: "sessions#create"
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"
  # get '/users/:id', to: "users#show", as: 'dashboard'
  get '/dashboard', to: "users#show"
  
  put "/cart", to: "carts#update"
  delete "/cart", to: "carts#destroy"
  get "/cart", to: "carts#index"
  get "/:name", to: "types#show"
  # get "*path" => redirect('/')
end