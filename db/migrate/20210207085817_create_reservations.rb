class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :to_reservation_id
      t.integer :from_reservation_id
      t.timestamps
    end
  end
end
