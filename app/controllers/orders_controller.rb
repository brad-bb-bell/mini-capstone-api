class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    if Order.find_by(user_id: current_user.id)
      @orders = current_user.orders
      render template: "orders/index"
    else
      render json: { message: "You have not placed any orders." }
    end
  end

  def create
    if current_user
      subtotal = 0
      carted_products = CartedProduct.where(status: "carted")
      carted_products.each do |carted_product|
        subtotal += carted_product.product.price * carted_product.quantity
      end
      @order = Order.new(
        user_id: current_user.id,
        subtotal: subtotal,
        tax: subtotal * 0.09,
        total: subtotal * 1.09,
      )
      if @order.save
        render template: "orders/show"
      else
        render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "You must me logged in to place an order." }
    end
  end

  def show
    @order = Order.find_by(id: params["id"])
    if current_user.id == @order.user_id
      render template: "orders/show"
    else
      render json: { message: "You do not have access to this order number." }
    end
  end
end
