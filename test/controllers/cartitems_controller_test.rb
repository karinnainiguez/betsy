require "test_helper"

describe CartitemsController do
  describe 'index' do
    it 'sends a success response when there are many cartitems' do
      Cartitem.count.must_be :>, 0

      get cart_path

      must_respond_with :success
    end

    it 'sends a success response when there are no cartitems' do
        Cartitem.destroy_all

        get cart_path

        must_respond_with :success
    end

    it "cartitem is associated with a order id" do
      a = Cartitem.first

     a.order_id.wont_be_nil

    end

    it 'is associated with a product id' do
      b = Cartitem.first
      b.order_id.wont_be_nil
    end
  end

describe 'delete' do
old_count = Cartitem.count
first = Cartitem.first

delete delete_cartitem_path(first)

must_respond_with :redirect
      must_redirect_to cartiems_path

      Cartitems.count.must_equal old_count - 1

end


end

#delete - destroy
#update - patch
#quantity
