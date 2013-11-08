class AddHealthToTraps < ActiveRecord::Migration
  def change
    add_column :traps, :health, :integer
  end
end
