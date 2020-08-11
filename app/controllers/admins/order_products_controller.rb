class Admins::OrderProductsController < Admins::ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = Order.find_by(id: @order_product.order_id)
    if @order_product.update(order_product_params)
      redirect_back(fallback_location: admins_order_path(@order.id))
          flash[:notice] = "製作ステータスを更新しました。"
          if @order_product.production_status == "製作中"
            @order.order_status =  "製作中"
            @order.save
          end
          @order.order_products.each do |product|
          if product.production_status == "製作完了"
            @order.order_status = "発送準備中"
            @order.save
          else
            @order.order_status = "製作中"
            @order.save
            break
          end
        end

    end

  end

  private
  def order_product_params
    params.require(:order_product).permit(:production_status)
  end

end
