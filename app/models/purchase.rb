class Purchase < ApplicationRecord
  belongs_to :company
  belongs_to :plan

  has_many :bots, dependent: :restrict_with_error
  has_many :cancellation_requests, class_name: 'PurchaseCancellation',
                                   dependent: :destroy

  enum status: { active: 0, inactive: 1 }

  before_create :generate_token

  def price_when_bought
    plan.price_at(created_at)
  end

  private

  def generate_token
    self.token = loop do
      token = SecureRandom.alphanumeric(6).upcase
      break token unless Purchase.exists?(token: token)
    end
  end
end
