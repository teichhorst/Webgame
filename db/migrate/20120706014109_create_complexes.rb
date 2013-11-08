class CreateComplexes < ActiveRecord::Migration
  def change
    create_table :complexes do |t|
      t.references :user
      t.references :city
      
      t.string :display_name
      t.string :description
      t.integer :buy
      t.integer :sell
      t.string :image
      
      t.timestamps
    end
  end
end
