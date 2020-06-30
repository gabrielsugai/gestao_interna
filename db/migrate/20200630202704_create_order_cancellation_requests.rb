class CreateOrderCancellationRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :order_cancellation_requests do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :status, default: 0
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
