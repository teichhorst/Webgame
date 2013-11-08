class AddImageToListGuards < ActiveRecord::Migration
  def change
    
    add_column :list_guards, :guard_image_file_name, :string
    add_column :list_guards, :guard_image_content_type, :string
    add_column :list_guards, :guard_image_file_size, :integer
    
  end
end
