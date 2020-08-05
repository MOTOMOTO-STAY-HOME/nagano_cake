class ChangeIsValidOfProductGenres < ActiveRecord::Migration[5.2]
  def up
    change_column :product_genres, :is_valid, :boolean, default: TRUE
  end


  def down
    change_column ::product_genres, :is_valid, :boolean,
  end
end
