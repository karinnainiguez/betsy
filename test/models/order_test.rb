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

    # it "is invalid without a name" do
    #   @order.name = nil
    #
    #   result = @order.valid?
    #
    #   result.must_equal false
    #
    # end
    #
    # it "is invalid with a duplicate cc" do
    #   dup_order = Order.first
    #
    #   @order.ccnumber = dup_order.ccnumber
    #
    #   result = @order.valid?
    #
    #   result.must_equal false
    # end

    it "can be created without all valid fields" do
    end

    it "cannot be purchased with invalid name" do
    end

    it "cannot be purchased with invalid cc number" do
    end

    it 'cannot be purchased if today is past cc expiration date' do
    end

    it 'cannot be purchased if cvv is invalid' do
    end
  end

  describe "relations" do
    before do
      @order = Order.first

    end

    it "connects order and cart_item" do
      cart_item = Cartitem.first

      @order.cartitems << cart_item

      @order.cartitem_ids.must_include cart_item.id
      end
  end
end
