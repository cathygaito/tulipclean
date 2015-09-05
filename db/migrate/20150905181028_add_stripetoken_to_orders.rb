class AddStripetokenToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :stripeToken, :string
  end
end
