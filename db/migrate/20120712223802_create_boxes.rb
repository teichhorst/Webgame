class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.references :user
      t.references :fight
      
      t.string :display_name
      t.integer :item_quantity
      t.integer :gold
      t.string :summary
      t.string :size
      t.integer :odds
      t.integer :loser
      t.boolean :opened
      t.string :description
      
      t.timestamps
    end
  end
end
