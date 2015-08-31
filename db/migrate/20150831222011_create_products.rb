class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :sku
      t.string :description
      t.money :price
      t.string :color
      t.string :flavor

      t.timestamps null: false
    end
  end
end
