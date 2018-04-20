require "test_helper"

describe User do
  describe "validations" do
    # all validations pass
    before do

      # user = User.first


      @user = User.new(name: "test name", email: "ada@ada.org")
    end

    it "can be created with all required fields" do
      # Act
      result = @user.valid?

      # Assert
      result.must_equal true

    end

    # no title -> fail
    it "is invalid without a name" do
      @user.name = nil
      @user.email = "dandragon@gmail.com"

      result = @user.valid?

      result.must_equal false
      # @user.must_include :name
    end

    it "is invalid without a name" do
      @user.name = "dan"
      @user.email = nil

      result = @user.valid?

      result.must_equal false
      # @user.must_include :email
    end

    it "is invalid with a duplicate name" do
      dup_user = User.first
      @user.name = dup_user.name

      result = @user.valid?

      result.must_equal false
      # @book.must_include :name
    end

    it "is invalid with a duplicate email" do
      dup_user = User.first
      @user.email = dup_user.email

      result = @user.valid?

      result.must_equal false
      # @book.must_include :email
    end
  end

  describe "relations" do
    before do
      @user = User.new(name: 'test name', email: "ada@ada.org")
    end


    it "connects products and product_ids" do
      # Arrange
      product = Product.first

      # Act
      @user.products << product

      # Assert
      @user.product_ids.must_include product.id


    end
  end

end
