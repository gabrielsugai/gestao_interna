class BlockBot < ApplicationRecord
  belongs_to :bot
  belongs_to :user

  def check_date(name)
    Company.left_joins(bots: :block_bot)
           .where(name: name).merge(BlockBot.where(updated_at: (Time.zone.now - 30.days)..Time.zone.now)).count
  end
end
