class CreateShips < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.references :customer, foreign_key: true
      t.string :name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
