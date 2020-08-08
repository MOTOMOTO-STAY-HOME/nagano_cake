class HomeController < ApplicationController

  def top
  	@product_genres = ProductGenre.where(is_valid: true)
  	@products = Product.where(is_sold: true).limit(4).order(updated_at: :desc)
  end

  def about
  end
end
