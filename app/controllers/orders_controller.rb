class OrdersController < ApplicationController

  def new
  	@order_payment = Order.new
  	@ship_address = Order.new
  end

  def show
  end

  def create
  end

  def index
  end

  def confirm
  end

  def thanks
  end

end
