class RenameColumnOnIncomes < ActiveRecord::Migration[7.1]
  def change
    rename_column :incomes, :type, :name
  end
end
