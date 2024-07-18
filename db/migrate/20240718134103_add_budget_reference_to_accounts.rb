class AddBudgetReferenceToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_reference :accounts, :budget, null: true, foreign_key: true
  end
end
