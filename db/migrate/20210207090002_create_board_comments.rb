class CreateBoardComments < ActiveRecord::Migration[5.2]
  def change
    create_table :board_comments do |t|
      t.references :user, foreign_key: true, null: false, type: :integer
      t.references :request_board, foreign_key: true, null: false, type: :integer
      t.text :comment, null: false
      t.timestamps
    end
  end
end
