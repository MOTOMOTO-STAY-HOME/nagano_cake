class Admins::ProductsController < ApplicationController

  def index
  	@products = Product.all
  end

  def show
  end

  def edit
  	@product = Product.find(params[:id])
  	@product_genre = ProductGenre.all
  end

  def new
    @product = Product.new
    @product_genre = ProductGenre.all
  end

  def create
  	@product = Product.new(product_params)
    @product_.save
  end

  def update
  	@product = Product.new(product_params)
  end

private

  def Product_params
     params.require(:product_params).permit(:id, :name, :discription, :no_tax_price, :image_id, :is_sold)
  end

end
