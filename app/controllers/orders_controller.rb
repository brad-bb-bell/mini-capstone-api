class OrdersController < ApplicationController
  def create
    if current_user
      order = Order.new(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
      )
      if order.save
        @order = order
        render json: { template: "orders/show" }
      else
        render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "You must me logged in to place an order." }
    end
  end

  def show
    @order = Order.find_by(id: params["id"])
    render template: "orders/show"
  end
end
