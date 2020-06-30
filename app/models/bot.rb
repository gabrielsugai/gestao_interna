class Bot < ApplicationRecord
  belongs_to :company
  belongs_to :order
  enum status: { active: 0, canceled: 5, blocked: 10 }
end
