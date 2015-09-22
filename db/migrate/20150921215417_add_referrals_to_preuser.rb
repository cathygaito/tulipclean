class AddReferralsToPreuser < ActiveRecord::Migration
  def change
    add_column :preusers, :referrals, :text, array: true, default: []
  end
end
