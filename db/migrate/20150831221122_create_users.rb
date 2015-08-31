class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :password_digest
      t.string :street
      t.string :apt
      t.string :city
      t.string :zip
      t.text :orders, array: true, default: []

      t.timestamps null: false
    end
  end
end
