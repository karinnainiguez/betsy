class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params, product: find_product)

        if @review.save
          redirect_to product_path
        else
          render :new
        end
  end


  private

    def review_params
      return params.require(:review).permit(:text, :rating)
    end

    def find_product
      @product = Product.find_by(id: params[:id])
      head :not_found unless @product
    end
end
