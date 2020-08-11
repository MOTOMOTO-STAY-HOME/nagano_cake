class Admins::OrdersController < Admins::ApplicationController

  PER = 10

  def index
    @orders = Order.all.page(params[:page]).per(PER)
  end

  def show
    @order = Order.find(params[:id])
    @total_price = @order.total_price
    @postage_price = @order.postages_price
    @order_status = Order.order_statuses
    @production_status = OrderProduct.production_statuses
  end

  def update
    @order =Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: @order.id)
    if @order.update(order_params)

      redirect_back(fallback_location: admins_order_path(@order.id))
      flash[:notice] = "注文ステータスを更新しました。"
      @order_products.each do |product|
        if @order.order_status == "入金確認"
          product.production_status = "製作待ち"
          product.save
        end
      end


    else
      render "show"
    end
  end

  private
    def order_params
      params.require(:order).permit(:shipping_name, :shipping_postal_code, :shipping_address, :payment_method, :order_status, :postage_price)
    end

end
