class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id, null: false
      t.integer :instructor_id, null: false
      t.timestamps
    end
  end
end
