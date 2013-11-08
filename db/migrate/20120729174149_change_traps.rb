class ChangeTraps < ActiveRecord::Migration
  def change
    add_column :traps, :min_speed, :integer
    add_column :traps, :max_speed, :integer
    add_column :traps, :min_damage, :integer
    add_column :traps, :max_damage, :integer
    add_column :traps, :min_block, :integer
    add_column :traps, :max_block, :integer
    remove_column :traps, :min_roll, :integer
    remove_column :traps, :max_roll, :integer
  end
end
