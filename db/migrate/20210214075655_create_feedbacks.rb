class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :age
      t.string :personality
      t.string :self_introduction
      t.string :message
      t.boolean :is_instructor, default: false, null: false
      t.timestamps
    end
  end
end
