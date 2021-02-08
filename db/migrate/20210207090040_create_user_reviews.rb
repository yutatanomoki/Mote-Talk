class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.integer :to_user_review_id
      t.integer :from_user_review_id
      t.timestamps
    end
  end
end
