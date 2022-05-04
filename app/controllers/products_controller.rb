class ProductsController < ApplicationController
  def all_products_method
    render(json: Product.all)
  end
end
