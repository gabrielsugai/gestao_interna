class CreateBotChats < ActiveRecord::Migration[6.0]
  def change
    create_table :bot_chats do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :platform
      t.string :external_token
      t.references :bot, null: false, foreign_key: true
      t.integer :message_count

      t.timestamps
    end

    add_index :bot_chats, :external_token, unique: true
  end
end
