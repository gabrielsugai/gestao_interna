class OrderCancellationRequest < ApplicationRecord
  belongs_to :order
  belongs_to :user, optional: true

  enum status: { open: 0, approved: 1, rejected: 2 }

  validate :check_for_open_requests

  private

  def check_for_open_requests
    open_requests = order.cancellation_requests.where(status: 'open')
    return if open_requests.empty?

    errors.add(:order, :has_an_open_cancellation_request)
  end
end
