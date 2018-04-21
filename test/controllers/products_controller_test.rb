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
    it 'creates a product associated with user' do
      
    end
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
  end

end
