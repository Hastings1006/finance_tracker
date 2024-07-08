class RenameColumnInIncomes < ActiveRecord::Migration[7.1]
  def change
    rename_column :incomes, :category, :category_id
  end
end
