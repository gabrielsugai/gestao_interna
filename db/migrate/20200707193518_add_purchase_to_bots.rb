class AddPurchaseToBots < ActiveRecord::Migration[6.0]
  def change
    add_reference :bots, :purchase, null: false, foreign_key: true
  end
end
