class HomeController < ApplicationController

  def top
  	@product_genres = ProductGenre.all
  	#@product_genres = PostGenre.where(is_valid: true)
  	@products = Product.where(is_sold: true).order(created_at: :desc).limit(4)
  end

  def about
  end
end
