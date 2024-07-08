class RenameColumnInExpenses < ActiveRecord::Migration[7.1]
  def change
    rename_column :expenses, :catagory_id, :category_id
  end
end
