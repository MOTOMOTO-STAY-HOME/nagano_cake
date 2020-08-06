class ChangeIsValidOfProductGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :product_genres, :is_valid, :boolean, default: TRUE
  end

end
