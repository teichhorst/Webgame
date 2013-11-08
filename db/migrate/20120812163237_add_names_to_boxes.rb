class AddNamesToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :user_name, :string
    add_column :boxes, :loser_name, :string
  end
end
