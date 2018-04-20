require "test_helper"
describe Order do

  describe "validations" do
    before do
      @order = orders(:one)
    end

    it "can be created with all required fields" do

      result = @order.valid?

      result.must_equal true

    end

    it "is invalid without a name" do
      @order.name = nil

      result = @order.valid?

      result.must_equal false

    end

    it "is invalid with a duplicate cc" do
      dup_order = Order.first

      @order.ccnumber = dup_order.ccnumber

      result = @order.valid?

      result.must_equal false
    end
  end

  describe "relations" do
    before do
      @order = Order.first

    end

    it "connects order and cart_item"

    cart_item = CartItem.first

    @order.cart_item = cart_item

    @order.cart_id.must_equal cart_item.id


  end


end
