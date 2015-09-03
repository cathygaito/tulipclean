class OrdersController < ApplicationController
  include OrdersHelper
  before_action :require_login, only: [:new, :create, :edit, :update, :show, :index, :destroy]

  def new
  end

  def create
    if existing_order?
      @order = Order.find(open_order)
      push_update(@order, order_params)
    else
      @order = Order.new(order_params)
      push_order(@order)
    end

    if @order.save
      send_user(@order) unless existing_order?
      redirect_to products_path
    else
      redirect_to root_path
    end
  end

  def show
    @user = @current_user
    @order = Order.find(params[:id])
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:id, :item, :quantity, :productID, :orderTotal, :shipmentTracker, :delivered, :user_id)
  end

  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end
end
