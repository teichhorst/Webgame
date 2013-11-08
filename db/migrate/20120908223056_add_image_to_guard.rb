class AddImageToGuard < ActiveRecord::Migration
  def change
    change_table :guards do |t|
      t.references :list_guard
    end
  end
end
