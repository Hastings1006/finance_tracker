class RenameCatagoryToCategories < ActiveRecord::Migration[7.1]
  def change
    rename_table :catagories, :categories
  end
end
