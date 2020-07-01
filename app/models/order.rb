class Order < ApplicationRecord
  belongs_to :company
  belongs_to :plan
  has_one :bots, dependent: :restrict_with_error
end
