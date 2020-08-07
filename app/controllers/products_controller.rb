class ProductsController < ApplicationController
	def index
		@products = Product.all
		@product_genres = ProductGenre.all
	end

	def show
		@product = Product.find(params[:id])
	end
end
