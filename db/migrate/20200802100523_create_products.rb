class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.text :discription
      t.integer :no_tax_price
      t.string :image_id
      t.boolean :is_sold

      t.timestamps
    end
  end
end
