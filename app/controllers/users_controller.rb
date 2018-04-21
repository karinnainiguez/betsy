class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new()
  end

  def edit
    @user
  end

  def update

  end

  def destroy
    if @user.deactivate && @user.destroy
      flash[:success] = "User deactivated from our site"
      redirect_to root_path

    else
      flash[:failure] = "Unable to remove user"
      render :index, status: :bad_request
    end


  end

  private

  def find_user
    @user = User.find(params[:id])

    head :not_found unless @user
  end

end
