class AddSanitytoUsers < ActiveRecord::Migration
  def change
    
    add_column :users, :sanity, :integer
    add_column :users, :health, :integer
    add_column :users, :base_health, :integer
    add_column :users, :hunger, :integer
    
    add_column :guards, :base_health, :integer
    add_column :guards, :hunger, :integer
    
    add_column :traps, :base_health, :integer
    add_column :traps, :durability, :integer
    
    add_column :pets, :base_health, :integer
    add_column :pets, :hunger, :integer
    
  end
end
