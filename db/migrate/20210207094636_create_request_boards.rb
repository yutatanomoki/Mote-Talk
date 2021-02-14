class CreateRequestBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :request_boards do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
