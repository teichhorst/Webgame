class CreateSidearms < ActiveRecord::Migration
  def change
    create_table :sidearms do |t|
      t.references :user
      
      t.boolean :active
      t.string :display_name
      t.string :description
      t.integer :min_guard_roll
      t.integer :max_guard_roll
      t.integer :min_pet_roll
      t.integer :max_pet_roll
      t.integer :min_trap_roll
      t.integer :max_trap_roll
      t.string :quality
      t.string :image
      t.string :strength
      t.string :weakness
      t.string :strength_roll
      t.boolean :bought
      
      t.integer :buy
      t.integer :sell
      
      t.timestamps
    end
  end
end
