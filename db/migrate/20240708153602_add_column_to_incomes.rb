class AddColumnToIncomes < ActiveRecord::Migration[7.1]
  def change
    add_column :incomes, :type, :string
  end
end
