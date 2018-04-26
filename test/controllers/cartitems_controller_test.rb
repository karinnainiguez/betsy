require "test_helper"

describe CartitemsController do
  describe 'index' do
    it 'sends a success reresponse when there are many cartitems' do
      Cartitem.count.must_be :>, 0

      get cart_path

      must_respond_with :success
    end

    it 'sends a success response when there are no cartitems' do
      Cartitem.destroy_all

      get cart_path

      must_respond_with :success
    end

  end

  describe 'create' do
    # describe 'it can create a valid cartitem' do
    #   # Arrange
    #   cartitem_data = {
    #     quantity: 1,
    #     user_id: User.first.id,
    #     order_id: Order.first.id
    #   }
    #   old_cartitem_count = Cartitem.count
    #
    #   # Assumptions
    #   Cartitem.new(cartitem_data).must_be :valid?

    # Act
    # post books_path, params: { book: book_data }
    #
    # # Assert
    # must_respond_with :redirect
    # must_redirect_to books_path
    #
    # Book.count.must_equal old_book_count + 1
    # Book.last.title.must_equal book_data[:title]
  end


  describe 'delete' do

    it "something" do

      order = Order.create!
      product = Product.create!(
        name: 'test-test-product',
        price: 44,
        stock: 4,
        user: User.first
      )

      b = Cartitem.create!(quantity: 3, order: order, product: product)


      old_count = Cartitem.count

      delete delete_cartitem_path(b)

      must_respond_with :redirect
      must_redirect_to cart_path

      Cartitem.count.must_equal old_count - 1
    end


    # old_count = Cartitem.count
    #
    # id = Cartitem.first.id
    #
    #
    # delete delete_cartitem_path(id)
    #
    # must_respond_with :redirect
    #       must_redirect_to cartitems_path
    #
    #       Cartitems.count.must_equal old_count - 1

  end
end

# describe 'delete' do
# old_count = Cartitem.count
# first = Cartitem.first
#
# delete delete_cartitem_path(first)
#
# must_respond_with :redirect
#       must_redirect_to cartiems_path
#
#       Cartitems.count.must_equal old_count - 1
#
# end



#delete - destroy
#update - patch
#quantity
