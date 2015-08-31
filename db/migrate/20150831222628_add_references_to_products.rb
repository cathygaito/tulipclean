class AddReferencesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :order_id, :integer
    add_index :products, :order_id
    add_foreign_key :products, :orders
  end
end
