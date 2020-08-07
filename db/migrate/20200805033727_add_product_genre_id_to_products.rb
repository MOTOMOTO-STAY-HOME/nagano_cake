class AddProductGenreIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_genre_id, :integer
  end
end
