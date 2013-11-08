class AddUserHealthToFights < ActiveRecord::Migration
  def change
    add_column :fights, :user_health, :integer
  end
end
