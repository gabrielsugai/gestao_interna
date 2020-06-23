class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :token
      t.string :name
      t.string :cnpj
      t.boolean :blocked, default: false

      t.timestamps
    end
  end
end
