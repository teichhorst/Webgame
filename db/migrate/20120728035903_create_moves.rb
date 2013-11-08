class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.references :user
      t.references :fight
      
      t.integer :opponent
      t.integer :attacker
      t.integer :defender
      t.integer :opponent_health_loss
      t.integer :opponent_health_before
      t.integer :opponent_health_after
      t.integer :health_loss
      t.integer :health_before
      t.integer :health_after
      t.integer :stamina_loss
      t.integer :stamina_before
      t.integer :stamina_after
      t.string :description
      
      t.timestamps
    end
  end
end
