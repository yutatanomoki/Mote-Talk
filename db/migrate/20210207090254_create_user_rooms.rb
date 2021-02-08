class CreateUserRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rooms do |t|
      t.bigint "user_id", null: false
      t.bigint "room_id", null: false
      t.timestamps
    end
  end
end
