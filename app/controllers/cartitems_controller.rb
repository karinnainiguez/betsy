class CartitemsController < ApplicationController
    before_action :find_cartitem, only: [:update, :destroy]

  def index
    @cart_items = Cartitem.where(order_id: session[:order_id])
  end

  def create
    #  get quantity from form
    @cart_item = Cartitem.new(cartitem_params)
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

    @cart_item.assign_attributes(cartitem_params)
    if @cart_item.save
      redirect_to cart_path
    else
      flash[:failure] = "Sorry, not able to update!"
      redirect_to cart_path
    end
  end

  def destroy

    if @cart_item.destroy
      flash[:success] = "Item deleted from cart"
      redirect_to cart_path
    else
      flash[:failure] = "Sorry not able to remove item from your cart!"
      redirect_to cart_path
    end

  end

  private

  def cartitem_params
    return params.require(:cartitem).permit(:quantity)
  end

  def find_cartitem
    @cart_item = Cartitem.find_by(id: params[:id])
    head :not_found unless @cart_item
  end

end
