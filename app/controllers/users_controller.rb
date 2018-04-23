class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @available = @user.products.select{|p| !p.product_status && p.stock > 0}
    @soldout = @user.products.select{|p| !p.product_status && p.stock == 0}
    @retired = @user.products.select{|p| p.product_status == 'retired'}
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     flash[:success] = "User added successfully"
  #     redirect_to user_path(@user)
  #   else
  #     flash[:failure] = "Validations Failed"
  #     render :new, status: :bad_request
  #   end
  # end

  def edit; end

  def update
    @user.assign_attributes(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :edit, status: :bad_request
    end

  end

  def destroy
    if @user.deactivate

      if @user.destroy
        flash[:success] = "User deactivated from our site"
        redirect_to root_path
      else
        flash[:failure] = "Unable to remove user"
        render :index, status: :bad_request
      end

    else
      flash[:failure] = "Unable to deactivate user"
      render :index, status: :bad_request
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])

    head :not_found unless @user
  end

  def user_params
    return params.require(:user).permit(:name, :email)
  end

end
