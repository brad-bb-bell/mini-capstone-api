class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all
    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = categories.products
    else
      render template: "products/index"
    end
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def create
    if current_user && current_user.admin
      @product = Product.new(
        name: params["name"],
        description: params["description"],
        price: params["price"],
        supplier_id: params["supplier_id"],
      )
      if @product.save
        render template: "products/show"
      else
        render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["name"] || product.name
    product.description = params["description"] || product.description
    product.price = params["price"] || product.price
    if product.save
      product = product
      render template: "products/show"
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: { message: "Product has been deleted" }
  end
end
