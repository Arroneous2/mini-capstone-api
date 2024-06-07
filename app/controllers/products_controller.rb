class ProductsController < ApplicationController
  belongs_to :supplier
  has_many :images
  has_many :orders

  def index
    pp current_user
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find(params[:id])
    render template: "products/show"
  end

  def create 
    @product = Product.new(name: params[:name], price: params[:price], description: params[:description])
    @product.save
    render template: "products/show"
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
