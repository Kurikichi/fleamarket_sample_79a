class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :category_id, null:false, forign_key:true
      t.integer :user_id, null:false, forign_key:true
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price, null: false
      t.string :brand
      t.string :status, null: false
      t.integer :shipping_charges, null: false
      t.string :shipping_origin, null: false
      t.integer :days_until_shipping, null: false

      t.timestamps
    end
  end
end
