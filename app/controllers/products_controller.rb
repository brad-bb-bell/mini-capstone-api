class ProductsController < ApplicationController
  def index
    product = Product.all
    render json: product.as_json
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: params["name"],
      description: params["description"],
      image_url: params["image_url"],
      price: params["price"],
    )
    product.save
    render product.as_json
  end
end
