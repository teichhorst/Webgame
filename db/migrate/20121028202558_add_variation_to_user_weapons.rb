class AddVariationToUserWeapons < ActiveRecord::Migration
  def change
    
    add_column :users, :weapon_min_damage, :integer
    add_column :users, :weapon_max_damage, :integer
    add_column :users, :sidearm_min_damage, :integer
    add_column :users, :sidearm_max_damage, :integer
    
    remove_column :users, :min_damage
    remove_column :users, :max_damage
    
  end
end
