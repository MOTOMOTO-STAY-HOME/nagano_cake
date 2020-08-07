class ChangeIsValidOfProductGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :product_genres, :is_valid, :boolean, default: TRUE
  end

<<<<<<< HEAD
=======

>>>>>>> 39eefc60eae2dcebb68e693ef6e41f5ab6c3d94c
end
