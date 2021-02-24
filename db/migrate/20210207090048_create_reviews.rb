class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :instructor_id
      t.text :content
      t.integer :score
      t.timestamps
    end
  end
end
