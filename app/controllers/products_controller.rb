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
    @product = Product.new(name: "Test Create", price: 200, image_url: "https://us-tuna-sounds-images.voicemod.net/96a51c85-9b68-4368-8530-f824db4dd10d-1661095056602.jpg", description: "This is just some text for a test")
    @product.save
    render template: "products/show"
  end
end
