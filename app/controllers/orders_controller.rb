class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @user_carted_products = current_user.carted_products
    carted_products_subtotal = 0
    carted_products_tax = 0
    carted_products_total = 0
    @user_carted_products.each do |carted_product|
      if carted_product.status == "carted"
        carted_products_subtotal  += carted_product.product.price * carted_product.quantity
        carted_products_tax += carted_product.product.tax * carted_product.quantity
        carted_products_total += carted_product.product.total * carted_product.quantity
        carted_product.update(status: "purchased")
      end
    end
    @order = Order.new(
      user_id: current_user.id,
      subtotal: carted_products_subtotal,
      tax: carted_products_tax,
      total:carted_products_total,
    )

    if @order.save
      @user_carted_products.each do |carted_product|
        if carted_product.status == "carted"
          carted_product.update(status: "purchased", order_id: @order.id)
        end
      end
      render :show
    else
      render json: { errors: "could not save" }, status: :bad_request
    end
  end

  def index
    @orders = current_user.orders
    render :index
  end

  def show
    @order = Order.find(params[:id])
    if current_user.id == @order.user_id
      render :show
    end
  end
end