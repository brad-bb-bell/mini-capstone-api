Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/all_products" => "products#all_products_method"
  get "/bicycle" => "products#bicycle_method"
  get "/tent" => "products#tent_method"
  get "/sleeping_bag" => "products#sleeping_bag_method"
  get "/one_product/:id" => "products#one_product"
end
