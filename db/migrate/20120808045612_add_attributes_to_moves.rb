class AddAttributesToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :user_speed, :integer
    add_column :moves, :user_damage, :integer
    add_column :moves, :user_block, :integer
    add_column :moves, :opponent_speed, :integer
    add_column :moves, :opponent_damage, :integer
    add_column :moves, :opponent_block, :integer
  end
end
