class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.integer :expense_type_id
      t.date :date
      t.integer :amount
      t.string :note
      t.string :image_id

      t.timestamps
    end
  end
end
