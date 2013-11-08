class AddLevelsToEverything < ActiveRecord::Migration
  def change
    add_column :rooms, :level, :integer
    add_column :guards, :level, :integer
    add_column :pets, :level, :integer
    add_column :traps, :level, :integer
    add_column :furnishings, :level, :integer
  end
end
