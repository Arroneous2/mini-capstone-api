class OrdersController < ApplicationController
  before_action :authenticate_user

  def create
    @product = Product.where(id: params[:product_id])[0]
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: @product.price * params[:quantity].to_i ,
      tax: @product.tax * params[:quantity].to_i,
      total: @product.total * params[:quantity].to_i,
    )
    @order.save!
    render :show
  end

  def index
    @orders = Order.where(user_id: current_user.id)
    render :index
  end

  def show
    @order = Order.find(params[:id])
    if current_user.id == @order.user_id
      render :show
    else
      render json: {error: "Nah ah ah, not your stuff"}
    end
  end
end
