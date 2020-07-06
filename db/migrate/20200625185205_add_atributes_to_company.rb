class AddAtributesToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :address, :string
    add_column :companies, :corporate_name, :string
  end
end
