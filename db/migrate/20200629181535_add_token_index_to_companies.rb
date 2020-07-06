class AddTokenIndexToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_index(:companies, :token, unique: true)
  end
end
