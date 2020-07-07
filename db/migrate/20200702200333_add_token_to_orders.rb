class AddTokenToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :token, :string
    add_index :orders, :token, unique: true
  end
end
