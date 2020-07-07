class RenameOrdersToPurchase < ActiveRecord::Migration[6.0]
  def change
    rename_table :orders, :purchases
    rename_table :order_cancellation_requests, :purchase_cancellations
  end
end
