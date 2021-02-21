class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.integer :user_id, null: false
      t.integer :age, null: false
      t.string :personality, null: false
      t.string :self_introduction, null: false
      t.string :message, null: false

      t.timestamps
    end
  end
end
