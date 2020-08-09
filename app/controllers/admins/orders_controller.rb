class Admins::OrdersController < Admins::ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @total_price = @order.total_price
    @postage_price = @order.postages_price
    @order_status = Order.order_status
  end

  def update
    @order_product = OrderProduct.find(params[])
    @order =Order.find(params[:id])
      if @order.update(order_params)
        redirect_back(fallback_location: admins_order_path(@order.id))
        flash[:notice] = "注文ステータスを更新しました。"
      else
        render "show"
      end

    if Order.order_status == 2
      @ = OrderProduct.production_status
    elsif Order.order_status == 3

    end

  end

  private
  def order_params
    params.require(:order).permit(:shipping_name, :shipping_postal_code, :shipping_address, :payment_method, :order_status, :postage_price)
  end

end
