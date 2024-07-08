class RenameColumnInTransactions < ActiveRecord::Migration[7.1]
  def change
    rename_column :transactions, :catagory_id, :category_id
  end
end
