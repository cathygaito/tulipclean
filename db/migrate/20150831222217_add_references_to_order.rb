class AddReferencesToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :integer
    add_index :orders, :user_id
    add_foreign_key :orders, :users
  end
end
