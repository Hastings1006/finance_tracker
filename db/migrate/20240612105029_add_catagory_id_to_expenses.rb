class AddCatagoryIdToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_reference :expenses, :catagory, null: false, foreign_key: true
  end
end
     