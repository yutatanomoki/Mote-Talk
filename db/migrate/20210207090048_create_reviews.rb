class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, null: false, type: :integer
      t.references :user_reviews, foreign_key: true, null: false, type: :integer
      t.text :content, null: false
      t.timestamps
    end
  end
end
