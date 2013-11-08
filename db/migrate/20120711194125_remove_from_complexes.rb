class RemoveFromComplexes < ActiveRecord::Migration
  def change
    
    remove_column :complexes, :description, :string
    remove_column :complexes, :buy, :integer
    remove_column :complexes, :sell, :integer
    
  end
end
