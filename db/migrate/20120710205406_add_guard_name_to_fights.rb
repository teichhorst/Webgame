class AddGuardNameToFights < ActiveRecord::Migration
  def change
    
    add_column :fights, :guard_name, :string
    add_column :fights, :pet_name, :string
    add_column :fights, :trap_name, :string
    
  end
end
