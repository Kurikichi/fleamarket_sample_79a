class RemoveSalerFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :saler_id, :integer
  end
end
