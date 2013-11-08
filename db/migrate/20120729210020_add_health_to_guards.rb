class AddHealthToGuards < ActiveRecord::Migration
  def change
    add_column :guards, :health, :integer
  end
end
