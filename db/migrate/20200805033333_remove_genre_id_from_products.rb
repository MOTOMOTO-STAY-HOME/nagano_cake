class RemoveGenreIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :genre_id, :integer
  end
end
