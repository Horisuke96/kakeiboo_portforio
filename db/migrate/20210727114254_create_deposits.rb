class CreateDeposits < ActiveRecord::Migration[5.2]
  def change
    create_table :deposits do |t|
      t.integer :user_id
      t.date :date
      t.integer :amount
      t.string :note
      t.string :image_id

      t.timestamps
    end
  end
end
