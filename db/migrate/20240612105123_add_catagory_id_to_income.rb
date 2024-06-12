class AddCatagoryIdToIncome < ActiveRecord::Migration[7.1]
  def change
    add_reference :incomes, :catagory, null: false, foreign_key: true
  end
end
