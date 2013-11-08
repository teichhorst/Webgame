class RemoveFromFights < ActiveRecord::Migration
  def change
    
    remove_column :fights, :room_total, :integer
    remove_column :fights, :user_total, :integer
    
  end
end
