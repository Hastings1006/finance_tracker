class RenameColumnInIncome < ActiveRecord::Migration[7.1]
  def change
    rename_column :incomes, :catagory_id, :category_id
  end
end
