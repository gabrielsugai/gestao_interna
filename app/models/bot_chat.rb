class BotChat < ApplicationRecord
  belongs_to :bot

  validates :external_token, :start_time, :platform, :bot, presence: true
end
