class ProductsController < ApplicationController
  def new
  end

  def create
  end

  def show
    @products = Product.find(params[:id])
    @order = Order.new
  end

  def index
    @products = Product.all
  end

  def update
  end

  def destroy
  end
end
