class OrderCancellationRequest < ApplicationRecord
  belongs_to :order
  belongs_to :user

  enum status: { open: 0, approved: 1, rejected: 2 }
end
