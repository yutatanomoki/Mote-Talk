class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :user_id, null: false
      t.integer :instructor_id, null: false
      t.datetime :date, null:false
      t.datetime :begin_time, null: false
      t.datetime :finish_time, null: false
      t.timestamps
    end
  end
end
