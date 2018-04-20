require "test_helper"

describe Review do
  before do
    user = User.create!
    @product = Product.create!(user: user)
  end

  describe "validations" do
    it "can be created with all valid data" do
      review = Review.new(product: @product, rating: 4)

      result = review.valid?

      result.must_equal true
    end

    it "cannot be created with invalid data" do
      review = Review.new(product: @product, rating: 4)


    end

    it "cannot be created with insufficient data" do
      review = Review.new

      result = review.valid?

      result.must_equal false

      # second insufficient:

      review2 = Review.new(product: @product)

      result2 = review2.valid?

      result2.must_equal false
    end

  end

  describe "relations" do
    it "connects product and product_id" do
      review = Review.new(product: @product)

      result = review.product_id

      result.must_equal @product.id
    end

  end
end
