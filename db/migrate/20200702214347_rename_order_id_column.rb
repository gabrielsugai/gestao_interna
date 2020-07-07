class RenameOrderIdColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :purchase_cancellations, :order_id, :purchase_id
  end
end
