class ChangeGuards < ActiveRecord::Migration
  def change
    add_column :guards, :min_speed, :integer
    add_column :guards, :max_speed, :integer
    add_column :guards, :min_damage, :integer
    add_column :guards, :max_damage, :integer
    add_column :guards, :min_block, :integer
    add_column :guards, :max_block, :integer
    remove_column :guards, :min_roll, :integer
    remove_column :guards, :max_roll, :integer
  end
end
