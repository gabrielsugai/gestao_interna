class Order < ApplicationRecord
  belongs_to :company
  belongs_to :plan

  validates :company, presence: true
end
