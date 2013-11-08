class AddOddsToListGuards < ActiveRecord::Migration
  def change
    add_column :list_guards, :odds, :integer
    
    remove_column :list_guards, :level, :integer
  end
end
