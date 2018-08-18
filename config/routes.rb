Rails.application.routes.draw do
  get "timeline_orders", to: "shippings#index"
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
    resources :orders, only: %i(index show show_shipper)
  end
  resources :carts
  get "add_cart", to: "carts#add_cart", as: "add_cart"
  delete "remove_cart", to: "carts#remove_cart", as: "remove_cart"
  get "decrease", to: "carts#decrease", as: "decrease"
  get "increase", to: "carts#increase", as: "increase"
  resources :orders
  resources :shippers
  get "show_shipper", to: "orders#show_shipper", as: "show_shipper"
  get "receive", to: "shippings#receive", as: "receive"
  delete "/not_receive", to: "shippings#destroy"
  get "finished_order", to: "shippers#finished_order", as: "finished_order"
end
