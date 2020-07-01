class RemoveAttributeFromPlans < ActiveRecord::Migration[6.0]
  def change
    remove_column :plans, :price, :string
  end
end
