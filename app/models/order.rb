class Order < ApplicationRecord
  belongs_to :company
  belongs_to :plan
  has_many :bots
end
