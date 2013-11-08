class CreateFurnishings < ActiveRecord::Migration
  def change
    create_table :furnishings do |t|
      t.references :user
      t.references :room
      
      t.string :display_name
      t.integer :buy
      t.integer :sell
      t.integer :worth
      t.string :image
      
      t.timestamps
    end
  end
end
