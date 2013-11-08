class AddReferencesToMoves < ActiveRecord::Migration
  def change
    change_table :moves do |t|
      t.references :guard
      t.references :pet
      t.references :trap
    end
  end
end
