class AddHealthToFights < ActiveRecord::Migration
  def change
    add_column :fights, :health, :integer
  end
end
