class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    if params[:name]
      @category = Category.find_by(name: params[:name])
      @products = @category.products
    else
      @products = Product.all
    end
    render :index
  end

  def show
    @product = Product.find(params[:id])
    render template: "products/show"
  end

  def create 
    @product = Product.new(
      name: params[:name], 
      price: params[:price], 
      description: params[:description],
      supplier_id: params[:supplier_id]
      )
    @product.save
    render :show
  end
  
  def update
    @product = Product.find(params[:id])
    @product.update(
      name: @product.name = params[:name]|| @product.name,
      price: @product.price = params[:price]|| @product.price,
      description: @product.description = params[:description]|| @product.description
    )
    render template: "products/show"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render template: "products/show"
  end
end
