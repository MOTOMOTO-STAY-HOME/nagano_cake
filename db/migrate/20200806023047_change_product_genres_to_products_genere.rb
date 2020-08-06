class ChangeProductGenresToProductsGenere < ActiveRecord::Migration[5.2]
  def change
    rename_table :product_genres, :products_genere
  end
end
