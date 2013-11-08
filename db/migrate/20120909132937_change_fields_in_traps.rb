class ChangeFieldsInTraps < ActiveRecord::Migration
  def change
    
    add_column :traps, :bg_color, :string
    add_column :traps, :base_min_damage, :integer
    add_column :traps, :base_max_damage, :integer
    add_column :traps, :base_min_speed, :integer
    add_column :traps, :base_max_speed, :integer
    add_column :traps, :base_min_block, :integer
    add_column :traps, :base_max_block, :integer
    
    change_table :traps do |t|
      t.references :list_trap
    end
    
  end
end
