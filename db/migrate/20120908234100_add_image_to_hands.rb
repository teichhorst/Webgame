class AddImageToHands < ActiveRecord::Migration
  def change
    change_table :hands do |t|
      t.references :list_hand
    end
  end
end
