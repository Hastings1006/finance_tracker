class AddColumnToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :name, :string
  end
end
