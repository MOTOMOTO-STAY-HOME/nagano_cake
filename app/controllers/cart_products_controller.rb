class CartProductsController < ApplicationController
	before_action :authenticate_customer!
	before_action :ensure_correct_customer, only:[:destroy]

	def create
		@product = Product.find(params[:cart_product][:product_id])
		@customer_cart_products = current_customer.cart_products.pluck(:product_id)
		unless params[:cart_product][:quantity] == ""
			if @customer_cart_products.include?(@product.id)
				@cart_product = CartProduct.find_by(customer_id: current_customer.id, product_id: @product.id)
				@cart_product.quantity += params[:cart_product][:quantity].to_i
				@cart_product.save
				flash[:success]="カートに追加されました。"
				redirect_to cart_products_path
			else
				@cart_product = current_customer.cart_products.new(cart_product_params)
				@cart_product.save
				flash[:success] = "カートに入りました。"
				redirect_to cart_products_path
			end
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
		if @cart_product.update(cart_product_params)
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

	def correct_customer
		@cart_product =CartProduct.find(params[:id])
		unless @cart_product.id == current_costomer.id
			redirect_back(fallback_location: root_url)
		end
	end
end