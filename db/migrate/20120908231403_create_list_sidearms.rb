class CreateListSidearms < ActiveRecord::Migration
  def change
    create_table :list_sidearms do |t|
      t.string :display_name
      t.string :description
      
      t.integer :min_speed
      t.integer :max_speed
      t.integer :min_block
      t.integer :max_block
      t.integer :min_damage
      t.integer :max_damage
      t.integer :odds
      
      t.string :sidearm_image_file_name
      t.string :sidearm_image_content_type
      t.integer :sidearm_image_file_size
      

      t.timestamps
    end
  end
end
