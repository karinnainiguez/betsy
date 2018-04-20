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

  end

  private

  def find_user
    @user = User.find(params[:id])

    head :not_found unless @user
  end

end
