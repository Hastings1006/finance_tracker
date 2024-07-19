class DropTransactionCategories < ActiveRecord::Migration[7.1]
  def change
    drop_table :transaction_categories do |t|
      t.references :transaction, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
