class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, null: false
      t.references :user_reviews, foreign_key: true, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
