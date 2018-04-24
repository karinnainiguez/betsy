class CartitemsController < ApplicationController

  def index
    @cart_items = CartItem.where(order_id: session[:order_id])
  end



  def create
    #  get quantity from form
    @cart_item = CartItem.new(cart_item_params)
    #  find the product from path
    @cart_item.product = Product.find(params[:product_id])

    #  find order from session /
    # create new order if no session
    if session[:order_id]
      @cart_item.order = Order.find(session[:order_id])
    else
      order = Order.create!
      @cart_item.order = order
      session[:order_id] = order.id
    end


    # save
    if @cart_item.save
      flash[:success] = "Item Added Successfully!"
      redirect_to cart_path
    else
      flash[:failure] = "Sorry, not able to add!"
      redirect_back fallback_location: root
    end

  end

  def update
    #update quantity of item

  end

  def destroy

  end

  private

  def cart_item_params
    return params.require(:cart_item).permit(:quantity)
  end

end
