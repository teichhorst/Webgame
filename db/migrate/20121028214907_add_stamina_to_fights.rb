class AddStaminaToFights < ActiveRecord::Migration
  def change
    
    add_column :fights, :user_stamina, :integer
    add_column :fights, :guard_stamina, :integer
    add_column :fights, :pet_stamina, :integer
    add_column :fights, :trap_stamina, :integer
    
  end
end
