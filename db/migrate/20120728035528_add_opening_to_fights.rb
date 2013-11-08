class AddOpeningToFights < ActiveRecord::Migration
  def change
    add_column :fights, :opening, :string
  end
end
