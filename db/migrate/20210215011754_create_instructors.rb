class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.integer :age
      t.string :personality
      t.string :self_introduction
      t.string :message
      
      t.timestamps
    end
  end
end
