class OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @ship = Ship.new
    @order_product = OrderProduct.new
    @order = Order.new
  end

 def confirm
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    if params == "address1"
      @order_address = Customer.where(current_customer.id).address
    elsif params == "address2"
      @order_address = Ship.where(id: :full_address[:id]).
    else
      @order_address = Order.find(params[:order][:shipping_name])
    end

    @ship = current_customer.ships.build(ship_params)
    @order = current_customer.orders.build(order_params)
    @order_product = current_customer.order_products.build
 end

  def create
    @ship = current_customer.ships.build(ship_params)
    @order = current_customer.orders.build(order_params)
    @order_product = current_customer.order_products.build(order_product_params)
    if @ship.save && @order_product.save && @order.save
      flash[:success] = "注文できました。"
      redirect_to orders_thanks_path
    else
      flash[:danger] = "注文できませんでした。"
      render :new
    end
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
  end

  def thanks
  end

    private
      def ship_params
        params.require(:ship).permit(:name, :postal_code, :address)
      end

      def order_params
        params.require(:order).permit(:customer_id, :shipping_name, :shipping_postal_code, :shipping_address, :payment_method, :total_price, :order_status, :postages_price)
      end

      def order_product_params
        params.require(:oreder_product).permit(:order_id, :product_id, :quantity, :unit_price)
      end

end
