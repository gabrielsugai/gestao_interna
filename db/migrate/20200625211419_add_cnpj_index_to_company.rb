class AddCnpjIndexToCompany < ActiveRecord::Migration[6.0]
  def change
    add_index(:companies, :cnpj, unique: true)
  end
end
