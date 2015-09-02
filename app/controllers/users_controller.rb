class UsersController < ApplicationController
  before_action :require_login, only: [:edit, :update, :show, :index, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:id, :first, :last, :email, :street, :apt, :city, :state, :zip, :password, :password_confirmation, :purchases)
  end

  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end
end
