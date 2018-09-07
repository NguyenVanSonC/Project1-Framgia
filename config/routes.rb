Rails.application.routes.draw do
  get "search_products/index"
  root "static_pages#home"
  resources :products, only: %i(show)
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/products/rate", to: "rater#create", as: "rate"
  get "/following", to: "following#index"
  resources :users
  resources :products, only: %i(show)
  resources :following, only: %i(create destroy)
  get "filter_items", to: "products#filter_products", as: "filter_items"
  resources :comments
  resources :products, only: %i(show) do
    resources :comments
  end
  namespace :admin do
    root "products#index"
    resources :products, only: %i(index new create edit update destroy)
    resources :categories, only: %i(index new create edit update destroy)
    resources :users, only: %i(index destroy)
  end
end
