class CategoriesController < ApplicationController

  def index
    @categories = Category.select_with_products
  end

  def show
    @category = Category.find_by(id: params[:id])
    @products = @category.products
  end

  def new
    @category = Category.new(product_id: params[:product_id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      # redirect_to '/books'
      flash[:success] = "Category created successfully"
      redirect_to categories_path
    else
      # Validations failed! What do we do?
      # This flash message is redundant but for demonstration purposes
      flash.now[:failure] = "Validations Failed"
      render :new, status: :bad_request
    end
  end

  def destroy


  end

private

  def category_params
    params.require(:category).permit(:name)
  end
end
