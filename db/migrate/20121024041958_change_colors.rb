class ChangeColors < ActiveRecord::Migration
  def change
  
    remove_column :boots, :bg_color
    remove_column :chests, :bg_color
    remove_column :guards, :bg_color
    remove_column :hands, :bg_color
    remove_column :heads, :bg_color
    remove_column :legs, :bg_color
    remove_column :pets, :bg_color
    remove_column :rings, :bg_color
    remove_column :sidearms, :bg_color
    remove_column :traps, :bg_color
    remove_column :weapons, :bg_color
    
    
    change_table :boots do |t|
      t.references :color
    end
    
    change_table :chests do |t|
      t.references :color
    end
    
    change_table :guards do |t|
      t.references :color
    end
    
    change_table :hands do |t|
      t.references :color
    end
    
    change_table :heads do |t|
      t.references :color
    end
    
    change_table :legs do |t|
      t.references :color
    end
    
    change_table :pets do |t|
      t.references :color
    end
    
    change_table :rings do |t|
      t.references :color
    end
    
    change_table :sidearms do |t|
      t.references :color
    end
    
    change_table :traps do |t|
      t.references :color
    end
    
    change_table :weapons do |t|
      t.references :color
    end
  
  end
end
