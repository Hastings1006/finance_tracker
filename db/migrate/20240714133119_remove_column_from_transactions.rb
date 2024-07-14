class RemoveColumnFromTransactions < ActiveRecord::Migration[7.1]
  def change
    remove_column :transactions, :transaction_time
  end
end
