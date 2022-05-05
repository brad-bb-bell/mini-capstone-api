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
    render json: product.as_json
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["name"] || product.name
    product.description = params["description"] || product.description
    product.image_url = params["image_url"] || product.image_url
    product.price = params["price"] || product.price
    product.save
    render json: product.as_json
    # render json: { message: "we updated it!" }
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: { message: "Product has been deleted" }
  end
end
