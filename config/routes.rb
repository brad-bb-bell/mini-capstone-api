Rails.application.routes.draw do
  ###product routes
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

  ###authentication routes
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  ###orders
  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"

  ###carted_products
  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
end
