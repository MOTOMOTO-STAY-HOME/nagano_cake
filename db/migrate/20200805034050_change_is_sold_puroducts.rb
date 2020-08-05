class ChangeIsSoldPuroducts < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :is_sold, :boolean, default: TRUE
  end


  def down
    change_column :products, :is_sold, :boolean
  end
end
