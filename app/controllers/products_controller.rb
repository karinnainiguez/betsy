class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new(user_id: params[:user_id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      flash[:failure] = "failed to save"
      render :new, :status => :bad_request
    end
  end

  def show
    @review = Review.new
  end

  def edit;end

  def update
    product= Product.find(params[:id])
    product.assign_attributes(product_params)
    if product.save
      redirect_to product_path(product)
    else
      render :edit, :status => :bad_request
    end
  end

  def retire
    product = Product.find(params[:id])
    product.product_status = 'retired'

    if product.save
      redirect_to products_path
    else
      flash[:failure]="Unable to delete the product"
      redirect_to products_path
    end
  end


  private
  def product_params
    return params.require(:product).permit(:name, :price, :stock, :product_status, :user_id)
  end

  def find_product
    @product = Product.find_by(id: params[:id])

    head :not_found unless @product
  end

end
