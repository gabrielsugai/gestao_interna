class Company < ApplicationRecord
  has_many :bots, dependent: :destroy
end
