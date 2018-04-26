require "test_helper"

describe OrdersController do

  describe "index" do
    it "sends success when the user is signed in" do
      login(User.first)

      get orders_path

      must_respond_with :success
    end

    it "responds with unauthorized if not signed in" do
      get orders_path

      must_respond_with :unauthorized
    end

  end

  describe "show" do
    it "responds with success" do
      order = Order.create!
      session[:order_id] = order.id

      get order_path(order)

      must_respond_with :success

    end

  end

  describe "edit" do

  end
  describe "update" do

  end

  describe "destroy" do

  end

end
