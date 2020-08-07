class OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
  end

  def index
  end

  def show
  end

  def confirm
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_name, :shipping_postal_code, :shipping_address, :payment_method, :total_price, :order_status, :postages_price)
  end

end
