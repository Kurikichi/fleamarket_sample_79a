class RemoveCategoryNameFromCategory < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :category_name, :string
  end
end
