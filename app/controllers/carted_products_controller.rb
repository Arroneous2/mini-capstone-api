class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    render :index
  end

  def create 
    CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: params[:order_id],
      status: "carted"
    )
    render json: {message: "made successfully"}
  end

  def show
    @carted_product = CartedProduct.find(params[:id])
    render :show
  end

  def destroy
    @carted_product = CartedProduct.find(params[:id])
    if current_user.id == @carted_product.user_id
      @carted_product.update(status: "removed")
      render :show
    else
      render json: {message: "not yours to delete"}
    end
  end

end
