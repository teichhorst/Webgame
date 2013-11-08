class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.references :user
      t.references :room
      
      t.integer :user_total
      t.integer :room_total
      t.integer :guard_total
      t.integer :pet_total
      t.integer :trap_total
      t.integer :fight_total
      t.integer :odds
      t.boolean :fought
      t.boolean :won_by_thief
      t.string :description
      
      t.timestamps
    end
  end
end
