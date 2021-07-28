class AddAchievementToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :achievement, :string
  end
end
