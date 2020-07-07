class BotChat < ApplicationRecord
  belongs_to :bot

  validates :external_token, :start_time, :platform, :bot, presence: true
  validates :external_token, uniqueness: true
end
