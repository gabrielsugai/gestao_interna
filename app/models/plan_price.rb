class PlanPrice < ApplicationRecord
  belongs_to :plan

  validates :value, presence: true
end
