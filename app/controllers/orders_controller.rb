class OrdersController < ApplicationController
  def index
    if Order.find_by(user_id: current_user)
      @orders = Order.where(user_id: current_user)
      render template: "orders/index"
    else
      render json: { message: "You have not placed any orders." }
    end
  end

  def create
    if current_user
      order = Order.new(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
        # subtotal: params["quantity"] *
      )
      if order.save
        @order = order
        render template: "orders/show"
      else
        render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "You must me logged in to place an order." }
    end
  end

  def show
    @order = Order.find_by(id: params["id"])
    if current_user[:id] == @order.user_id
      render template: "orders/show"
    else
      render json: { message: "You do not have access to this order number." }
    end
  end
end
