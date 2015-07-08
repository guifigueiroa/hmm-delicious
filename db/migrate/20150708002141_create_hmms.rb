class CreateHmms < ActiveRecord::Migration
  def change
    create_table :hmms do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :recipe, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :hmms, [:user_id, :recipe_id], unique: true
  end
end
