class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new(product_params)
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to products_path
    end
  end

  def show
    @product= Product.find(params[:id])
  end

  def edit
    @product= Product.find(params[:id])
  end

  def update
    product= Product.find(params[:id])
    product.assign_attributes(product_params)
    if product.save
      redirect_to product_path(product)
    end
  end

  def retire
      product = Product.find(params[:id])
      product.product_status = 'retired'

      if product.save
        redirect_to products_path
      end
  end


  private
  def product_params
    return params.require(:product).permit(:name, :price, :stock, :product_status)
  end

  def find_product
    @product = Product.find_by(id: params[:id])

    head :not_found unless @product
  end

end
