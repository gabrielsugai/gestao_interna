class CreateBots < ActiveRecord::Migration[6.0]
  def change
    create_table :bots do |t|
      t.references :company, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :status, default: 0
      t.string :token

      t.timestamps
    end
  end
end
