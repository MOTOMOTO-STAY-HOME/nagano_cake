class CartProductsController < ApplicationController

	before_action :authenticate_customer!

	def create
			@cart_product = current_customer.cart_products.new(cart_product_params)
		if 	@cart_product.save
			flash[:success] = "カートに入りました。"
			redirect_to cart_products_path
		else
			redirect_back(fallback_location: root_url)
		end
	end

	def index
		@cart_products = CartProduct.where(customer_id: current_customer.id).page(params[:page]).reverse_order
		@total_price =0
		@cart_products.each do |cart_product|
		@total_price += cart_product.include_tax_total_price
		end
	end

	def update
			@cart_product = CartProduct.find(params[:id])
		if 	@cart_product.update(cart_product_params)
			flash[:success] = "個数を変更しました。"
			redirect_to cart_products_path
		end
	end

	def destroy
		cart_product = CartProduct.find(params[:id])
		cart_product.destroy
		redirect_to cart_products_path
	end

	def reset
		cart_products = CartProduct.where(customer_id: current_customer.id)
		cart_products.destroy_all
		redirect_to cart_products_path
	end

	private
	def cart_product_params
		params.require(:cart_product).permit(:customer_id, :product_id, :quantity)
	end
end