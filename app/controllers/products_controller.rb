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
end
