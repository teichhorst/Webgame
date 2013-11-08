class AddLevelToHands < ActiveRecord::Migration
  def change
    
    add_column :hands, :level, :integer
    
  end
end
