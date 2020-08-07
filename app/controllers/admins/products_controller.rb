class Admins::ProductsController < Admins::ApplicationController
  def new
  end

  def index
  	@products = Product.all
  end

  def new
    @product = Product.new
    @product_genre = ProductGenre.all
  end

  def create
  	product = Product.new(product_params)
    product.save
    redirect_to admins_product_path(product.id)
  end

  def update
  	product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admins_product_path(product_params)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @product_genre = ProductGenre.all
  end

private

  def product_params
     params.require(:product).permit(:id, :product_genre_id, :name, :discription, :no_tax_price, :image, :is_sold)
  end

end
