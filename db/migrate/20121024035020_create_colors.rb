class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :display_name
      t.string :hex_code
      t.string :odds
      
      t.timestamps
    end
  end
end
