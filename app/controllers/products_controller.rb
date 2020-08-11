class ProductsController < ApplicationController
	PER = 9

	def index
		@products = Product.where(is_sold: true).page(params[:page]).per(PER)
		@product_genres = ProductGenre.where(is_valid:  true)
		#@cart_product = Cart_product.new
	end

	def show
		@product = Product.find(params[:id])
		@cart_product = CartProduct.new
	end

	#def create
		#cart_product= Cart_product.new(cart_product_params)☆
	  	#cart_product.save
	    #redirect_to cart_products_path
	#end
end
