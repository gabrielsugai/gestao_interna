class AddTokenIndexToBots < ActiveRecord::Migration[6.0]
  def change
    add_index(:bots, :token, unique: true)
  end
end
