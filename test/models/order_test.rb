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

      it "is invalid without a name" do
@order.name = nil

result = @order.valid?

result.must_equal false

      end



    end
  end
