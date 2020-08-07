class HomeController < ApplicationController

  def top
  	@product_genres = ProductGenre.where(is_valid: true)
  	@products = Product.where(is_sold: true).order(updated_at: :desc).limit(4)
  end

  def about
  end
end
