class Order < ApplicationRecord
  belongs_to :company
  belongs_to :plan

  has_many :cancellation_requests, class_name: 'OrderCancellationRequest',
                                   dependent: :destroy

  enum status: { active: 0, inactive: 1 }

  before_create :generate_token

  private

  def generate_token
    self.token = loop do
      token = SecureRandom.alphanumeric(6).upcase
      break token unless Order.exists?(token: token)
    end
  end
end
