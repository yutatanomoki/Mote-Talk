class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :to_favorite_id
      t.integer :from_favorite_id
      t.timestamps
    end
  end
end
