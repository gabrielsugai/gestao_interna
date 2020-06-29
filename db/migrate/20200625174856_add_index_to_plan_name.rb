class AddIndexToPlanName < ActiveRecord::Migration[6.0]
  def change
    add_index(:plans, :name, unique: true)
  end
end
