require "test_helper"

describe Product do
  describe "relations" do
    it "connects to user and user id" do
      user = User.create!
      product = Product.create!(user: user)

      product.user_id.must_equal user.id
    end

    it "has a list of categories" do
      user = User.create!
      product = Product.create!(user: user)
      product.must_respond_to :categories
      product.categories.each do |category|
        category.must_be_kind_of Category
      end
    end

    it "has a list of reviews" do
      user = User.create!
      product = Product.create!(user: user)
      product.must_respond_to :reviews
      product.reviews.each do |review|
        review.must_be_kind_of Review
      end
    end
  end

  describe "validations" do
    it 'requires a name' do
      name = "test name"
      user = User.new(name: name)
    end

    it ''

    it 'must belong to an existing category' do
    end


  end

end
