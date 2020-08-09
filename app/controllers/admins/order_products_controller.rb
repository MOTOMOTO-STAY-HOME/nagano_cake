class Admins::OrderProductsController < Admins::ApplicationController

  def update
    @order = Order.find(params[:id])
    @order_product = OrderProduct.find(params[:id])
    if @order_product.update(order_product_params)
      redirect_back(fallback_location: admins_order_path(@order.id))
          flash[:notice] = "製作ステータスを更新しました。"
    end
  end

  private
  def order_product_params
    params.require(:order_product).permit(:production_status)
  end

end
