class CreateProductGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :product_genres do |t|
      t.string :name
      t.boolean :now_used

      t.timestamps
    end
  end
end
