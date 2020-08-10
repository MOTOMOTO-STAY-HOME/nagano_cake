class OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_thanks_path

  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:ship] == "address 1"
      # customer = Customer.where(id: current_customer.id)
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = "#{current_customer.last_name}#{current_customer.first_name}"
    elsif params[:order][:ship] == "address 2"
      # ship = Ship.where(customer_id: current_customer.id)
      @order.shipping_postal_code = Ship.find(params[:ship][:id]).postal_code
      @order.shipping_address = Ship.find(params[:ship][:id]).address
      @order.shipping_name = Ship.find(params[:ship][:id]).name
    elsif #params[:order][:ship] == "address 3"
      @order.shipping_postal_code = @order.shipping_postal_code
      # @order.shipping_address = shipping_address
      # @order.shipping_name = shipping_name
    end

    @subtotal_price = 0
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @cart_products.each do |cart_product|
    @subtotal_price += (cart_product.product.no_tax_price * 1.1.to_f).floor * cart_product.quantity#19行目から22行目で合計金額定義
    end
  end

  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_name, :shipping_postal_code, :shipping_address, :payment_method, :total_price, :order_status, :postages_price)
  end
end