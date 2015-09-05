class OrdersController < ApplicationController
  include OrdersHelper
  before_action :require_login, only: [:new, :create, :edit, :update, :show, :index, :destroy]

  def new
  end

  def create
    if existing_order?
      @order = Order.find(find_open_order)
      push_update(@order, order_params)
    else
      @order = Order.new(order_params)
      push_order(@order)
    end

    if @order.save
      send_user(@order) if @current_user.purchases == [] || @current_user.purchases.exclude?("#{@order.id.to_i}")
      redirect_to products_path
    else
      redirect_to root_path
    end
  end

  def show
    @user = @current_user
    @order = Order.find(params[:id])
    @total = order_total(@order)
    @stripetotal = (@total * 100).round
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def payment
    push_stripe(params)
    @current_user = User.find_by(id: params[:user_id])
    redirect_to @current_user
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
