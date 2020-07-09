class BlockBotsController < ApplicationController
  def create
    @bot = Bot.find(params[:bot_id])
    @block_bot = BlockBot.new(bot_id: @bot.id, user: current_user)
    @bot.awaiting!
    @block_bot.save!
    redirect_to @bot
  end

  def confirm
    @bot = Bot.find(params[:bot_id])
    @block_bot = BlockBot.find_by(params[@bot.id])
    @bot.blocked!
    @block_bot.update(bot_id: @bot.id)
    redirect_to @bot
  end
end
