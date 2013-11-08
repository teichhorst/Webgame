class ChangeRings < ActiveRecord::Migration
  def change
    add_column :rings, :min_speed, :integer
    add_column :rings, :max_speed, :integer
    add_column :rings, :min_block, :integer
    add_column :rings, :max_block, :integer
    add_column :rings, :min_damage, :integer
    add_column :rings, :max_damage, :integer
    remove_column :rings, :min_guard_roll, :integer
    remove_column :rings, :max_guard_roll, :integer
    remove_column :rings, :min_pet_roll, :integer
    remove_column :rings, :max_pet_roll, :integer
    remove_column :rings, :min_trap_roll, :integer
    remove_column :rings, :max_trap_roll, :integer
  end
end
