Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  #created routes but need to work on controller
  get "/suppliers" => "suppliers#index"
  get "/suppliers/id" => "suppliers#show"
  post "/suppliers" => "suppliers#create"
  patch "/suppliers/:id" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#destroy"
  #created routes but need to work on controller

  #authentication routes
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  ###orders
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"
end
