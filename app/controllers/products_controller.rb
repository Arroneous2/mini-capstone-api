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
    @product = Product.new(name: params[:name], price: params[:price], image_url: params[:image_url], description: params[:description])
    @product.save
    render template: "products/show"
  end
  
  def update
    @product = Product.find(params[:id])
    @product.update(
      name: @product.name = params[:name]|| @product.name,
      price: @product.price = params[:price]|| @product.price,
      image_url: @product.image_url = params[:image_url]|| @product.image_url,
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
