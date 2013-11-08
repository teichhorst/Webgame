class ChangeHeads < ActiveRecord::Migration
  def change
    add_column :heads, :min_speed, :integer
    add_column :heads, :max_speed, :integer
    add_column :heads, :min_block, :integer
    add_column :heads, :max_block, :integer
    remove_column :heads, :min_guard_roll, :integer
    remove_column :heads, :max_guard_roll, :integer
    remove_column :heads, :min_pet_roll, :integer
    remove_column :heads, :max_pet_roll, :integer
    remove_column :heads, :min_trap_roll, :integer
    remove_column :heads, :max_trap_roll, :integer
  end
end
