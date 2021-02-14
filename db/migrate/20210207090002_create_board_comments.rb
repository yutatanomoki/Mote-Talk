class CreateBoardComments < ActiveRecord::Migration[5.2]
  def change
    create_table :board_comments do |t|
      t.integer :request_board_id
      t.integer :instructor_id
      t.text :comment, null: false
      t.timestamps
    end
  end
end
