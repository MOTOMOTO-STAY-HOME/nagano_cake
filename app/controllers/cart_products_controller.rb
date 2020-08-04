class CartProductsController < ApplicationController

	def create
		@cartproduct = CartProduct.new
		@cartproduct.save
		@quantity = Quantity.new
		@quantity = save
	end

	def index
	end

	def destroy
	end

	def update
	end

	def reset
	end

	private

	def cartproduct_params
		params.require(:cartproduct).permit(:customer_id, :product_id, :quantity)
	end

end