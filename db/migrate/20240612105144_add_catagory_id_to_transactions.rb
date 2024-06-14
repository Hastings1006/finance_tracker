class AddCatagoryIdToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :catagory, null: false, foreign_key: true
  end
end
