class CreatePreusers < ActiveRecord::Migration
  def change
    create_table :preusers do |t|
      t.string :email
      t.string :referral_code
      t.string :referrer_id

      t.timestamps null: false
    end
  end
end
