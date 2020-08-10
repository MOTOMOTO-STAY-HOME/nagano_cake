class OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
  end

  def index
  end

  def show
  end

  def confirm
        if params == "address 1"
          @orderaddress = Customer.where(current_customer.id)
        elsif params == "address 2"
          @orderaddress = Ship.where(:full_address[:id])
        else
          @orderaddress = Order.find(params[:order][:shipping_name])
        end
      end
    end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_name, :shipping_postal_code, :shipping_address, :payment_method, :total_price, :order_status, :postages_price)
  end