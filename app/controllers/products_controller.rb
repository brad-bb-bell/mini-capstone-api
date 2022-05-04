class ProductsController < ApplicationController
  def all_products_method
    product = Product.all
    render json: product.as_json
  end

  def bicycle_method
    product = Product.first
    render json: product.as_json
  end

  def tent_method
    product = Product.second
    render json: product.as_json
  end

  def sleeping_bag_method
    product = Product.third
    render json: product.as_json
  end
end
