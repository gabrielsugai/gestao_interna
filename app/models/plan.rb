class Plan < ApplicationRecord
  attr_accessor :price

  has_many :plan_prices, dependent: :destroy
  enum status: { active: 0, inactive: 1 }

  validates :name, :price, :platforms, :limit_daily_chat, :limit_monthly_chat,
            :limit_daily_messages, :limit_monthly_messages,
            :extra_message_price, :extra_chat_price, presence: true
  validates :name, uniqueness: true
  after_save_commit :create_plan_price

  scope :active, -> { where(status: :active) }

  def current_price
    plan_prices.last&.value
  end

  private

  def create_plan_price
    PlanPrice.create!(value: price, plan: self) unless current_price == price.to_f
  end
end
