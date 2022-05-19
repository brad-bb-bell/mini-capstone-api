class CartedProductsController < ApplicationController
  def create
    if current_user
      @carted_product = CartedProduct.new(
        user_id: current_user[:id],
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
end
