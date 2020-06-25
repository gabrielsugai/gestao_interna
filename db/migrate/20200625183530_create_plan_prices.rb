class CreatePlanPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_prices do |t|
      t.references :plan, null: false, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
