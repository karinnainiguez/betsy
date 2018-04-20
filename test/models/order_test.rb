require "test_helper"
describe Order do

  describe "validations" do
    before do

      end

      it "can be created with all required fields" do
        @order = Order.new()

        result = @order

        result.must_equal true
      end

      it "is invalid without a unique cc number" do
        @order
      end


    end
  end
