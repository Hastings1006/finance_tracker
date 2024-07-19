class CreatePots < ActiveRecord::Migration[7.1]
  def change
    create_table :pots do |t|
      t.string :name, null: false
      t.integer :goal, null: false
      t.integer :amount, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
