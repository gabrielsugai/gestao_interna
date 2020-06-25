class Company < ApplicationRecord
  validates :cnpj, uniqueness: true
end
