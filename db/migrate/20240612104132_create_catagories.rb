class CreateCatagories < ActiveRecord::Migration[7.1]
  def change
    create_table :catagories do |t|
      t.string :name, null: false, default: ""
      
      t.timestamps
    end
  end
end
