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

    it "can be created without all fields" do
      #set all to nil
      order = Order.new
      result = @order.valid?

      result.must_equal true
    end

    it 'can create a purchase with all valid fields' do
      result = @order.save(context: :purchase)
      result.must_equal true
    end

    it "cannot be purchased without all valid fields" do
      #take out email and zipcode
      @order.cvv = nil
      @order.name = nil
      result = @order.save(context: :purchase)
      result.must_equal false
    end

    it "cannot be purchased with invalid cc number" do
      @order.cvv = '123412341234123412341'
      result = @order.save(context: :purchase)
      result.must_equal false
    end

    it 'cannot be purchased if cc expiration date is invalid' do
      @order.ccexpiration = Date.today + (6*365)
      result = @order.save(context: :purchase)
      result.must_equal false
    end

    it 'cannot be purchased if cvv is invalid' do
      @order.cvv = '58690000'
      result = @order.save(context: :purchase)
      result.must_equal false
    end
  end

  describe "relations" do
    before do
      @order = Order.first
    end

    it "connects order and cart_item" do
      cart_item = Cartitem.create!(order: @order, product: Product.first, quantity: 3)
      @order.cartitem_ids.must_include cart_item.id
      end
  end
end
