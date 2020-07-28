class AddDetailsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :explanation, :text
    add_column :products, :brand, :string
    add_column :products, :status, :integer
    add_column :products, :shipping_charges, :integer
    add_column :products, :shipping_origin, :integer
    add_column :products, :days_until_shipping, :integer
    add_column :products, :category_id, :integer
    add_column :products, :user_id, :integer
  end
end
