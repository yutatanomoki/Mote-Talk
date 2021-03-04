class AddScoreToRequestBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :request_boards, :score, :decimal, precision: 5, scale: 3
  end
end
