class ChangeAttributesInMoves < ActiveRecord::Migration
  def change
    remove_column :moves, :defender, :integer
    remove_column :moves, :attacker, :integer
    add_column :moves, :attacker, :string
    add_column :moves, :defender, :string
  end
end
