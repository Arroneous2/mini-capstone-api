class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @user_carted_products = current_user.carted_products
    @carted_products = []
    @user_carted_products.each do |carted_product|
      if carted_product.status == "carted"
        @carted_products << carted_product
      end
    end

    
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
