class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.time :cooking_time

      t.timestamps null: false
    end
  end
end
