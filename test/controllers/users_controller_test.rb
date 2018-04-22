require "test_helper"

describe UsersController do
  describe "index" do
    it "sends a success response when there are many users" do
      User.count.must_be :>, 0

      get users_path

      must_respond_with :success
    end

    it "sends a success response when there are no users" do
      Review.destroy_all
      Product.destroy_all
      User.destroy_all

      User.count.must_equal 0
      get users_path

      must_respond_with :success
    end

  end

  describe "show" do
    it "sends success if the book exists" do
      get user_path(User.first)
      must_respond_with :success
    end

    it "sends not_found if the book doesnt exist" do
      user_id = User.last.id + 1
      get user_path(user_id)

      must_respond_with :not_found
    end

  end

  describe "new" do
    it "sends success" do
      get new_user_path
      must_respond_with :success

    end

  end

  describe "edit" do
    it "sends success if user exists" do
      get edit_user_path(User.first)
      must_respond_with :success
    end

    it "sends not_found if the book doesnt exist" do
      user_id = User.last.id + 1
      get edit_user_path(user_id)
      must_respond_with :not_found
    end
  end

  describe "create" do
    it "can add a valid user" do

    end

    it "won't add an invalid user" do

    end

  end

  describe "update" do
    it "updates an existing user with valid data" do

    end

    it "sends bad_request for invalid data" do

    end

    it "sends not_found for a bbook that doesnt exist" do

    end

  end

  describe "destroy" do
    it "destroys a real user" do

    end

    it "sends not_found when the user doesnt exist" do
      user_id = User.last.id
      old_user_count = User.count

      delete user_path(user_id)

      must_respond_with :not_found
      User.count.must_equal old_user_count


    end

  end
end
