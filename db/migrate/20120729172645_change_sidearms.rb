class ChangeSidearms < ActiveRecord::Migration
  def change
    add_column :sidearms, :min_speed, :integer
    add_column :sidearms, :max_speed, :integer
    add_column :sidearms, :min_damage, :integer
    add_column :sidearms, :max_damage, :integer
    add_column :sidearms, :min_block, :integer
    add_column :sidearms, :max_block, :integer
    remove_column :sidearms, :min_guard_roll, :integer
    remove_column :sidearms, :max_guard_roll, :integer
    remove_column :sidearms, :min_pet_roll, :integer
    remove_column :sidearms, :max_pet_roll, :integer
    remove_column :sidearms, :min_trap_roll, :integer
    remove_column :sidearms, :max_trap_roll, :integer
  end
end
