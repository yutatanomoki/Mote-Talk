class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.bigint "user_id", null: false
      t.bigint "room_id", null: false
      t.string "message", null: false
      t.timestamps
    end
  end
end
