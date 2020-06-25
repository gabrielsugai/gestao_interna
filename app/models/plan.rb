class Plan < ApplicationRecord
  attr_accessor :price

  has_many :plan_prices, dependent: :destroy

  after_save :create_plan_price

  def current_price
    plan_prices.last.value
  end

  private

  def create_plan_price
    PlanPrice.create(value: price, plan: self)
  end
end
