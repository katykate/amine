class OrdersController < ApplicationController

  def index
    @products = Product.all
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  def product_params
    params.require(:product).permit(:name, :description, :image_url, :colour, :price)
  end
end