class AddStaminaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stamina, :integer
  end
end
