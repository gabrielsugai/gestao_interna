class AddAttributesToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :platforms, :string
    add_column :plans, :limit_daily_chat, :integer
    add_column :plans, :limit_monthly_chat, :integer
    add_column :plans, :limit_daily_messages, :integer
    add_column :plans, :limit_monthly_messages, :integer
    add_column :plans, :extra_message_price, :float
    add_column :plans, :extra_chat_price, :float
  end
end
