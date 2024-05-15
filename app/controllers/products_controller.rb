class ProductsController < ApplicationController
  def index
    @product = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find(params[:id])
    render template: "products/show"
  end

  def create 
    @product = Product.new(name: params[:input_name], price: params[:input_price], image_url: params[:input_image_url], description: params[:input_description])
    @product.save
    render template: "products/show"
  end
  
  def update
    @product = Product.find(params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.description = params[:description]
    render template: "products/show"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render template: "products/show"
  end
end
