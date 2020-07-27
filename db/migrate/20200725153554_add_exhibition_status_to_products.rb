class AddExhibitionStatusToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :exhibition_status, :integer
  end
end
