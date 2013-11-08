class AddOptimizationToUsersAndRooms < ActiveRecord::Migration
  def change
    
    add_column :users, :max_damage, :integer
    add_column :users, :max_speed, :integer
    add_column :users, :max_block, :integer
    add_column :users, :min_damage, :integer
    add_column :users, :min_speed, :integer
    add_column :users, :min_block, :integer
    
    remove_column :users, :hunger
    remove_column :users, :sanity
    
  end
end
