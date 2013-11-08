class AddOpponentTypeToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :opponent_type, :string
  end
end
