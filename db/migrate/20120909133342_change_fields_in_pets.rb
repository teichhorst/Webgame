class ChangeFieldsInPets < ActiveRecord::Migration
  def change
    
    add_column :pets, :bg_color, :string
    add_column :pets, :base_min_damage, :integer
    add_column :pets, :base_max_damage, :integer
    add_column :pets, :base_min_speed, :integer
    add_column :pets, :base_max_speed, :integer
    add_column :pets, :base_min_block, :integer
    add_column :pets, :base_max_block, :integer
    
    change_table :pets do |t|
      t.references :list_pet
    end
    
  end
end
