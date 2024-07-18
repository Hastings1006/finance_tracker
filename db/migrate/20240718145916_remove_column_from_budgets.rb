class RemoveColumnFromBudgets < ActiveRecord::Migration[7.1]
  def change
    remove_column :accounts, :budget_id
  end
end
