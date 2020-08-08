class ProductGenresController < ApplicationController

  def show
  	@product = Product.where(product_genre_id: params[:id])
  	#プロダクトのテーブルから検索条件でジャンルのidを持ってきてる
  	@product_genre = ProductGenre.find(params[:id])
  	@product_genres = ProductGenre.where(is_valid:  true)
  end
end
