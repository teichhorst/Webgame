class ChangeFieldsInHands < ActiveRecord::Migration
  def change
    
    remove_column :hands, :image, :string
    
    add_column :hands, :bg_color, :string
    add_column :hands, :base_min_speed, :integer
    add_column :hands, :base_max_speed, :integer
    add_column :hands, :base_min_block, :integer
    add_column :hands, :base_max_block, :integer
    
  end

end
