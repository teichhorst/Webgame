class CreateListChests < ActiveRecord::Migration
  def change
    create_table :list_chests do |t|
      t.string :display_name
      t.string :description
      
      t.integer :min_speed
      t.integer :max_speed
      t.integer :min_block
      t.integer :max_block
      t.integer :min_damage
      t.integer :max_damage
      t.integer :odds
      
      t.string :chest_image_file_name
      t.string :chest_image_content_type
      t.integer :chest_image_file_size
      
      t.timestamps
    end
  end
end
