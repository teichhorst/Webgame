class ChangeFieldsInHeads < ActiveRecord::Migration
  def change
    
    add_column :weapons, :bg_color, :string
    add_column :weapons, :base_min_damage, :integer
    add_column :weapons, :base_max_damage, :integer
    add_column :weapons, :base_min_speed, :integer
    add_column :weapons, :base_max_speed, :integer
    add_column :weapons, :base_min_block, :integer
    add_column :weapons, :base_max_block, :integer
    add_column :weapons, :level, :integer
    
    remove_column :weapons, :image, :string
    
    change_table :weapons do |t|
      t.references :list_weapon
    end
    
    add_column :sidearms, :bg_color, :string
    add_column :sidearms, :base_min_damage, :integer
    add_column :sidearms, :base_max_damage, :integer
    add_column :sidearms, :base_min_speed, :integer
    add_column :sidearms, :base_max_speed, :integer
    add_column :sidearms, :base_min_block, :integer
    add_column :sidearms, :base_max_block, :integer
    add_column :sidearms, :level, :integer
    
    remove_column :sidearms, :image, :string
    
    change_table :sidearms do |t|
      t.references :list_sidearm
    end
    
    add_column :legs, :bg_color, :string
    add_column :legs, :base_min_speed, :integer
    add_column :legs, :base_max_speed, :integer
    add_column :legs, :base_min_block, :integer
    add_column :legs, :base_max_block, :integer
    add_column :legs, :level, :integer
    
    remove_column :legs, :image, :string
    
    change_table :legs do |t|
      t.references :list_leg
    end
    
    add_column :rings, :bg_color, :string
    add_column :rings, :base_min_damage, :integer
    add_column :rings, :base_max_damage, :integer
    add_column :rings, :base_min_speed, :integer
    add_column :rings, :base_max_speed, :integer
    add_column :rings, :base_min_block, :integer
    add_column :rings, :base_max_block, :integer
    add_column :rings, :level, :integer
    
    remove_column :rings, :image, :string
    
    change_table :rings do |t|
      t.references :list_ring
    end
    
    add_column :boots, :bg_color, :string
    add_column :boots, :base_min_speed, :integer
    add_column :boots, :base_max_speed, :integer
    add_column :boots, :base_min_block, :integer
    add_column :boots, :base_max_block, :integer
    add_column :boots, :level, :integer
    
    remove_column :boots, :image, :string
    
    change_table :boots do |t|
      t.references :list_boot
    end
    
    add_column :chests, :bg_color, :string
    add_column :chests, :base_min_speed, :integer
    add_column :chests, :base_max_speed, :integer
    add_column :chests, :base_min_block, :integer
    add_column :chests, :base_max_block, :integer
    add_column :chests, :level, :integer
    
    remove_column :chests, :image, :string
    
    change_table :chests do |t|
      t.references :list_chest
    end
    
    add_column :heads, :bg_color, :string
    add_column :heads, :base_min_speed, :integer
    add_column :heads, :base_max_speed, :integer
    add_column :heads, :base_min_block, :integer
    add_column :heads, :base_max_block, :integer
    add_column :heads, :level, :integer
    
    remove_column :heads, :image, :string
    
    change_table :heads do |t|
      t.references :list_head
    end
    
    add_column :guards, :bg_color, :string
    add_column :guards, :base_min_damage, :integer
    add_column :guards, :base_max_damage, :integer
    add_column :guards, :base_min_speed, :integer
    add_column :guards, :base_max_speed, :integer
    add_column :guards, :base_min_block, :integer
    add_column :guards, :base_max_block, :integer
    
  end
end
