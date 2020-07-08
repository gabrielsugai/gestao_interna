class RemoveOrderFromBots < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bots, :order, null: false, foreign_key: false
  end
end
