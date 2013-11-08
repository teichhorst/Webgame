class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :display_name
      t.integer :coordinate_x
      t.integer :coordinate_y
      
      t.timestamps
    end
  end
end
