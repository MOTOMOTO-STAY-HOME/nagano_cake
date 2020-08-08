class ProductGenresController < ApplicationController
  def index
  	@product = Product.where(product_genre_id: params[:id])
  	#プロダクトのテーブルから検索条件でジャンルのidを持ってきてる
  	@product_genre = ProductGenre.find(params[:id])
  end

  def show
  end
end
