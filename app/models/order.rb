class Order < ApplicationRecord
  belongs_to :company
  belongs_to :plan

  has_many :cancellation_requests, class_name: 'OrderCancellationRequest',
                                   dependent: :destroy
end
