class OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :have_cart_product, only:[:new, :confirm, :create]
  before_action :correct_customer, only:[:show]

  def new
    if current_customer.ships
      @customer_ship = Ship.find_by(customer_id: current_customer.id)
    end
    @order = Order.new
    #@ship = Ship.new(ship_params)
  end

 def confirm
    @order = current_customer.orders.new(order_params)
    @order_product = OrderProduct.new
    if params[:order][:ship] == "customer_address"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = "#{current_customer.last_name} #{current_customer.first_name}"
    elsif params[:order][:ship] == "registrated_address"
      @order.shipping_postal_code = Ship.find(params[:order][:customer_ship]).postal_code
      @order.shipping_address = Ship.find(params[:order][:customer_ship]).address
      @order.shipping_name = Ship.find(params[:order][:customer_ship]).name
    elsif params[:order][:ship] == "new_address"
      @ship = Ship.new
    else
      redirect_back(fallback_location: root_url)
    end
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @order.total_price = 0
    @cart_products.each do |cart_product|
      @order.total_price += cart_product.include_tax_total_price
    end
 end

  def create
    @order = current_customer.orders.create(order_params)
    @order_product = OrderProduct.new
    current_customer.cart_products.each do |cart_product|
      @order_product = @order.order_products.new(product_id: cart_product.product.id, quantity: cart_product.quantity, unit_price: cart_product.product.no_tax_price)
    end
    @ship = current_customer.ships.create(ship_params)
    if @order_product.save
      current_customer.cart_products.destroy_all
      redirect_to orders_thanks_url
    else
      flash.now[:danger] = "注文できませんでした。"
      render :new
    end
  end

  def index
    @orders = Order.where(customer_id: current_customer.id).page(params[:page]).reverse_order
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
        params.require(:order).permit(:customer_id, :shipping_name, :shipping_postal_code, :shipping_address, :payment_method, :total_price, :postages_price)
      end

      def have_cart_product
        unless current_customer.cart_products.exists?
          redirect_back(fallback_location: root_url)
        end
      end

      def correct_customer
        @order = Order.find(params[:id])
        unless @order.customer.id == current_customer.id
          redirect_back(fallback_location: root_url)
        end
      end
end
