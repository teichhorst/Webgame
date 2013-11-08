class AddOpponentDeathsToFights < ActiveRecord::Migration
  def change
    remove_column :fights, :guard_total, :integer
    remove_column :fights, :pet_total, :integer
    remove_column :fights, :trap_total, :integer
    remove_column :fights, :fight_total, :integer
    add_column :fights, :guard_defeated, :boolean
    add_column :fights, :pet_defeated, :boolean
    add_column :fights, :trap_defeated, :boolean
  end
end
