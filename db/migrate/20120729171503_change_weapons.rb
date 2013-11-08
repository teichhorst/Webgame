class ChangeWeapons < ActiveRecord::Migration
  def change
    add_column :weapons, :min_speed, :integer
    add_column :weapons, :max_speed, :integer
    add_column :weapons, :min_damage, :integer
    add_column :weapons, :max_damage, :integer
    add_column :weapons, :min_block, :integer
    add_column :weapons, :max_block, :integer
    remove_column :weapons, :min_guard_roll, :integer
    remove_column :weapons, :max_guard_roll, :integer
    remove_column :weapons, :min_pet_roll, :integer
    remove_column :weapons, :max_pet_roll, :integer
    remove_column :weapons, :min_trap_roll, :integer
    remove_column :weapons, :max_trap_roll, :integer
  end
end
