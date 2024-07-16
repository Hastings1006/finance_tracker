class RemoveCategoryColumnFromTransactions < ActiveRecord::Migration[7.1]
  def change
    remove_column :transactions, :category_id
  end
end
