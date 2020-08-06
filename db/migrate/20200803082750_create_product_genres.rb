class CreateProductGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :products_genere do |t|
      t.string :name
      t.boolean :now_used

      t.timestamps
    end
  end
end
