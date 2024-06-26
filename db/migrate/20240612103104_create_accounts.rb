class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false, default: ""
      t.integer :balance, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
