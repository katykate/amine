class OrdersController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json, :html


  def index
    if current_user.admin?
      @orders = Order.all  
    else  
      @orders = current_user.orders
    end
  end
  
  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

end