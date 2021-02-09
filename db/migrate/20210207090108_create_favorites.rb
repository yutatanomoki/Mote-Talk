class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true, null: false
      t.bigint :to_favorite_id
      t.bigint :from_favorite_id
      t.timestamps
    end
  end
end
