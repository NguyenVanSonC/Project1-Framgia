Rails.application.routes.draw do
  root "static_pages#home"
  resources :products, only: %i(show)
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users
end
