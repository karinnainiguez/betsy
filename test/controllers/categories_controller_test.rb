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
    it 'sends success if the categories exists' do
      get category_path(Category.first)
      must_respond_with :success
    end

    it 'sends not_found if the categories D.N.E.' do
      # Get an invalid book ID somehow
      # more than one way to do this
      category_id = Category.last.id + 1

      get category_path(category_id)

      must_respond_with :not_found
    end
  end

  describe 'new' do

  end

  describe 'create' do
  end

  describe 'destroy' do

  end

end
