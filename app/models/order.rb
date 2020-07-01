class Order < ApplicationRecord
  belongs_to :company
  belongs_to :plan

  has_many :order_cancellation_requests, dependent: :destroy
end
