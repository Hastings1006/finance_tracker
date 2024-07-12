class CreateBudgets < ActiveRecord::Migration[7.1]
  def change
    create_table :budgets do |t|
      t.string :name
      t.integer :ammount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
