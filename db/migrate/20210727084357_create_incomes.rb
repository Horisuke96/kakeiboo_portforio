class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :user_id
      t.integer :income_type_id
      t.date :date
      t.integer :amount
      t.string :note
      t.string :image_id

      t.timestamps
    end
  end
end
