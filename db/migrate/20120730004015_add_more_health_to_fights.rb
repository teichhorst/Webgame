class AddMoreHealthToFights < ActiveRecord::Migration
  def change
    add_column :fights, :pet_health, :integer
    add_column :fights, :guard_health, :integer
    add_column :fights, :trap_health, :integer
    remove_column :fights, :health, :integer
  end
end
