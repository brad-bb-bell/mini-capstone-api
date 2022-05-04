Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/all_products", controller: "products", action: "all_products_method"
  get "/bicycle", controller: "products", action: "bicycle_method"
  get "/tent", controller: "products", action: "tent_method"
  get "/sleeping_bag", controller: "products", action: "sleeping_bag_method"
end
