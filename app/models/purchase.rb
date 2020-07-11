class Purchase < ApplicationRecord
  belongs_to :company
  belongs_to :plan

  has_many :cancellation_requests, class_name: 'PurchaseCancellation',
                                   dependent: :destroy

  enum status: { active: 0, inactive: 5 }

  before_create :generate_token
  after_commit :create_bot, on: :create

  private

  def generate_token
    self.token = loop do
      token = SecureRandom.alphanumeric(6).upcase
      break token unless Purchase.exists?(token: token)
    end
  end

  def create_bot
    Bot.create!(purchase: self, company: company)
  end
end
