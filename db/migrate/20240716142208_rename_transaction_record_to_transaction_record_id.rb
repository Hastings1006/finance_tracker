class RenameTransactionRecordToTransactionRecordId < ActiveRecord::Migration[7.1]
  def change
    rename_column :transaction_categories, :transaction_record, :transaction_record_id
  end
end
