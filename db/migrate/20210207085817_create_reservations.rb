class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.bigint :to_reservation_id
      t.bigint :from_reservation_id
      t.datetime :date, null: false
      t.datetime :begin_time, null: false
      t.datetime :finish_time, null: false
      t.timestamps
    end
  end
end
