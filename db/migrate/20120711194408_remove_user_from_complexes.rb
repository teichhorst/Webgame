class RemoveUserFromComplexes < ActiveRecord::Migration
  def change
    
    
    remove_column :complexes, :user
    
    
  end
end
