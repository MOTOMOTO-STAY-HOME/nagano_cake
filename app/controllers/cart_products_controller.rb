class CartProductsController < ApplicationController

	def create
		@cartproduct = CartProduct.new
		@cartproduct.save
		@quantity = Quantity.new
		@quantity = save
	end

	def index
		# @cartproducts = CartProduct.all
		# @cartproduct = CartProduct.find(params[:id])
		# @taxprice = @cartproduct*1.08
	end

	def destroy
	end

	def update
		# @quantity = Quantity.find(params[:id])
		# @quantity.update
		# @subtotal = @taxprice*@quantity
		# @total = @subtotal.all.sum(:price)
	end

	def reset
	end

	private

	def cartproduct_params
		params.require(:cartproduct).permit(:customer_id, :product_id, :quantity)
	end

end