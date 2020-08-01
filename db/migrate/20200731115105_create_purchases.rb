class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :product_id, null:false
      t.integer :buyer_id, null:false
      t.timestamps
    end
  end
end
