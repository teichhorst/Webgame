class AddUserNameToFights < ActiveRecord::Migration
  def change
    add_column :fights, :room_user_name, :string
  end
end
