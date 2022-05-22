class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render json: { carted_products: @carted_products.as_json }
  end

  def create
    if current_user
      @carted_product = CartedProduct.new(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
        status: "carted",
      )
      if @carted_product.save
        render json: { message: "Product has been added to your cart" }
      else
        render json: { errors: carted_product.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    if current_user
      carted_product = current_user.carted_products.find_by(id: params["id"])
      carted_product.destroy
      render json: { message: "Product has been deleted" }
    else
      render json: {}, status: :unauthorized
    end
  end
end
