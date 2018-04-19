require "test_helper"

describe CartItem do
  let(:cart_item) { CartItem.new }

  it "must be valid" do
    value(cart_item).must_be :valid?
  end
end
