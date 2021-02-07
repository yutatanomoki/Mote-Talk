class CreateRequestBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :request_boards do |t|

      t.timestamps
    end
  end
end
