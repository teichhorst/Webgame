class ChangeBoots < ActiveRecord::Migration
  def change
    add_column :boots, :min_speed, :integer
    add_column :boots, :max_speed, :integer
    add_column :boots, :min_block, :integer
    add_column :boots, :max_block, :integer
    remove_column :boots, :min_guard_roll, :integer
    remove_column :boots, :max_guard_roll, :integer
    remove_column :boots, :min_pet_roll, :integer
    remove_column :boots, :max_pet_roll, :integer
    remove_column :boots, :min_trap_roll, :integer
    remove_column :boots, :max_trap_roll, :integer
  end
end
