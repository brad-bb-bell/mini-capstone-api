class ProductsController < ApplicationController
  def index
    product = Product.all
    render json: product.as_json
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end
end
