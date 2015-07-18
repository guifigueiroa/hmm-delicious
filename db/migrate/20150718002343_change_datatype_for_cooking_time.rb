class ChangeDatatypeForCookingTime < ActiveRecord::Migration
  def change
    change_column :recipes, :cooking_time,  :integer
  end
end
