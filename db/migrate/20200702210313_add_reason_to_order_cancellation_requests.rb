class AddReasonToOrderCancellationRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :order_cancellation_requests, :reason, :string
  end
end
