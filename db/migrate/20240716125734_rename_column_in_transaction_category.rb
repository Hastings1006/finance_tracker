class RenameColumnInTransactionCategory < ActiveRecord::Migration[7.1]
  def change
    rename_column :transaction_categories, :transaction_id, :transaction_record
  end
end
