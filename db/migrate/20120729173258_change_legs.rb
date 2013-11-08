class ChangeLegs < ActiveRecord::Migration
  def change
    add_column :legs, :min_speed, :integer
    add_column :legs, :max_speed, :integer
    add_column :legs, :min_block, :integer
    add_column :legs, :max_block, :integer
    remove_column :legs, :min_guard_roll, :integer
    remove_column :legs, :max_guard_roll, :integer
    remove_column :legs, :min_pet_roll, :integer
    remove_column :legs, :max_pet_roll, :integer
    remove_column :legs, :min_trap_roll, :integer
    remove_column :legs, :max_trap_roll, :integer
  end
end
