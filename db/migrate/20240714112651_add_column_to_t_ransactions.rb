class AddColumnToTRansactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :transaction_date, :date
    add_column :transactions, :transaction_time, :time
  end
end
