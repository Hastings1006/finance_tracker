class ChangeColumnNameTransactions < ActiveRecord::Migration[7.1]
  def change
    rename_column :transactions, :name, :transaction_type
  end
end
