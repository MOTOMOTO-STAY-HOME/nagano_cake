class ProductsController < ApplicationController
	PER = 9

	def index
		@products = Product.page(params[:page]).per(PER)
		@product_genres = ProductGenre.where(is_valid:  true)
	end

	def show
		@product = Product.find(params[:id])
		@cart_product = CartProduct.new
	end
end
