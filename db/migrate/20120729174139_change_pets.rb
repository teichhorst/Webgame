class ChangePets < ActiveRecord::Migration
  def change
    add_column :pets, :min_speed, :integer
    add_column :pets, :max_speed, :integer
    add_column :pets, :min_damage, :integer
    add_column :pets, :max_damage, :integer
    add_column :pets, :min_block, :integer
    add_column :pets, :max_block, :integer
    remove_column :pets, :min_roll, :integer
    remove_column :pets, :max_roll, :integer
  end
end
