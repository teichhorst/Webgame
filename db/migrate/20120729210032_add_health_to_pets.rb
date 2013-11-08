class AddHealthToPets < ActiveRecord::Migration
  def change
    add_column :pets, :health, :integer
  end
end
