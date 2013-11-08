class ChangeHands < ActiveRecord::Migration
  def change
    add_column :hands, :min_speed, :integer
    add_column :hands, :max_speed, :integer
    add_column :hands, :min_block, :integer
    add_column :hands, :max_block, :integer
    remove_column :hands, :min_guard_roll, :integer
    remove_column :hands, :max_guard_roll, :integer
    remove_column :hands, :min_pet_roll, :integer
    remove_column :hands, :max_pet_roll, :integer
    remove_column :hands, :min_trap_roll, :integer
    remove_column :hands, :max_trap_roll, :integer
  end
end
