require "test_helper"

describe ProductsController do

  describe 'index' do
    it 'sends a success response when there are many products' do
      # Assumptions
      Product.count.must_be :>, 0

      # Act
      get products_path

      # Assert
      must_respond_with :success

    end
  end

  describe 'new' do
    it 'responds with success' do
      get new_product_path
      must_respond_with :success
    end

    it 'creates a product associated with user' do

      product = Product.first

      product.user_id.wont_equal nil

    end

  end

  it 'can add a product' do
    # Arrange
    product_data = {
      name: "test-name",
      price: 11,
      stock: 4,
      product_status: nil,
      user_id: User.first.id
    }
    old_product_count = Product.count

    # Assumptions
    Product.new(product_data).must_be :valid?

    # Act
    post products_path, params: { product: product_data }

    #Assert
    must_respond_with :redirect
    must_redirect_to products_path

    Product.count.must_equal old_product_count + 1
    Product.last.id.must_equal product_data[:id]
  end

  describe 'retired' do

    it 'changes a product_status when a product is retired' do
      @product = Product.first

      # @product.retire
      post retire_path(@product)

      #fetch info from db for test
      @product.reload

      @product.product_status.must_equal 'retired'

    end

    # it 'retires products associated with user when user is deleted' do
    #   products = user.products
    #   user.destroy
    #   products.first.product_status.must_equal 'retired'
    # end
  end
end
