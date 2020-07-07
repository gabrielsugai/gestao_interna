class Bot < ApplicationRecord
  belongs_to :company
  belongs_to :purchase

  enum status: { active: 0, canceled: 5, blocked: 10 }

  validates :token, uniqueness: true
  before_create :generate_token

  private

  def generate_token
    self.token = loop do
      token = SecureRandom.alphanumeric(6).upcase
      break token unless Bot.exists?(token: token)
    end
  end
end
