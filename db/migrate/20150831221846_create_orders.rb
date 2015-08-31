class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :item, array: true, default: []
      t.integer :quantity
      t.integer :productID
      t.money :orderTotal
      t.string :shipmentTracker
      t.boolean :delivered

      t.timestamps null: false
    end
  end
end
