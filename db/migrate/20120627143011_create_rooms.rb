class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :user
      t.references :complex
      t.references :guard
      t.references :trap
      t.references :pet
      
      t.string :display_name
      t.string :description
      t.integer :lock_price
      t.integer :buy
      t.integer :sell
      t.integer :worth
      t.string :image     
     

      t.timestamps
    end
  end
end
