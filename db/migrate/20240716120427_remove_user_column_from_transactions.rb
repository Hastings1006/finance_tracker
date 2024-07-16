class RemoveUserColumnFromTransactions < ActiveRecord::Migration[7.1]
  def change
    remove_column :transactions, :user_id
  end
end
