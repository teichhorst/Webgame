class CreateTraps < ActiveRecord::Migration
  def change
    create_table :traps do |t|
      t.references :room
      t.references :user
      
      t.string :display_name
      t.string :description
      t.integer :min_roll
      t.integer :max_roll
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
