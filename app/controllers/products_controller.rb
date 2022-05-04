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
      name: "New thing",
      description: "This thing is sweet",
      image_url: "www.test.com/test.jpg",
      price: 99,
    )
    product.save
    render product.as_json
  end
end
