class OrdersController < ApplicationController

  def index
    if session[:order_id].nil?
      @order = Order.create
      session[:order_id] = @order.id
      #order index is shopping cart view
    else
      @order = Order.find(session[:order_id])
    end
  end

  def show
    #confirmation page after they have paid
    order = Order.find_by(id: session[:order_id])
  end

  def new
  end

  def create

  end

  def edit
    #put in credit card information
    #change from pending to paid
  end

  def update

  end

  def destroy

  end

end
