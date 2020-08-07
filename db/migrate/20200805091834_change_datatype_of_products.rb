class ChangeDatatypeOfProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :status, :integer
    change_column :products, :shipping_origin, :integer
  end
end
