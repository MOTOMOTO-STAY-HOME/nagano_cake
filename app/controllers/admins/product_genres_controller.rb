class Admins::ProductGenresController < ApplicationController
  def index
  	@product_genres = ProductGenre.all
  	@product_genre = ProductGenre.new
  end

  def create
  	product_genre= ProductGenre.new(product_genre_params)
  	product_genre.save
    redirect_to admins_product_genres_path
  end

  def update
  	product_genre = ProductGenre.find(params[:id])
    product_genre.update(product_genre_params)
    redirect_to admins_product_genres_path(product_genre_params)
  end

  def edit
  	@product_genre = ProductGenre.find(params[:id])
  end


	private

	def product_genre_params
		params.require(:product_genre).permit(:name, :is_valid)
	end

end
