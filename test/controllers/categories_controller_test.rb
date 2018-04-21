require "test_helper"

describe CategoriesController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  describe 'index' do
    it 'sends a success response when there are many categories' do
      # Assumptions
      Category.count.must_be :>, 0
      # Act
      get categories_path
      # Assert
      must_respond_with :success
    end

    it 'sends a success response when there are no categories' do
      # Arrange
      Category.destroy_all
      # Act
      get categories_path
      # Assert
      must_respond_with :success
    end
  end

  describe 'show' do

  end

  describe 'new' do

  end

  describe 'create' do
  end

  describe 'destroy' do

  end

end
