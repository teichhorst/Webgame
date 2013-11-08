class AddBoughtatshopToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :bought_at_shop, :boolean
  end
end
