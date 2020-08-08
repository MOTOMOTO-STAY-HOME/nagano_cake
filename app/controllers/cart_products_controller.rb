class CartProductsController < ApplicationController

	before_action :authenticate_customer!

	def create
		@cartproduct = CartProduct.new
		@cartproduct.save(cartproduct_params)
	end

	def index
		@cartproducts = CartProduct.where(product_id: current_customer.id)
	end

	def update
		@c = CartProduct.find(params[:id])
		@c.update(cartproduct_params)
		redirect_to cart_products_path
	end

	def destroy
		@cartproducts = CartProduct.find(params[:id])
		@cartproducts.destroy
		redirect_to cart_products_path
	end

	def reset
	end

	private
	def cartproduct_params
		params.require(:cart_product).permit(:customer_id, :product_id, :quantity)
	end
end