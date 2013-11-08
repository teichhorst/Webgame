class AddBoughtToFurnishings < ActiveRecord::Migration
  def change
    add_column :furnishings, :bought, :boolean
  end
end
