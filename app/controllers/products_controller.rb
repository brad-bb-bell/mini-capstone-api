class ProductsController < ApplicationController
  def all_products_method
    render(json: Product.all)
  end

  def bicycle_method
    render(json: Product.first)
  end

  def tent_method
    render(json: Product.second)
  end

  def sleeping_bag_method
    render(json: Product.third)
  end
end
