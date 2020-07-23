class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :name
      t.text :explanation
      t.integer :price
      t.string :brand
      t.string :status
      t.integer :shipping_charges
      t.string :shipping_origin
      t.integer :days_until_shipping

      t.timestamps
    end
  end
end
