class ChangeChests < ActiveRecord::Migration
  def change
    add_column :chests, :min_speed, :integer
    add_column :chests, :max_speed, :integer
    add_column :chests, :min_block, :integer
    add_column :chests, :max_block, :integer
    remove_column :chests, :min_guard_roll, :integer
    remove_column :chests, :max_guard_roll, :integer
    remove_column :chests, :min_pet_roll, :integer
    remove_column :chests, :max_pet_roll, :integer
    remove_column :chests, :min_trap_roll, :integer
    remove_column :chests, :max_trap_roll, :integer
  end
end
