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
    block_company
    @block_bot.update(user: current_user)
    redirect_to @bot
  end

  private

  def block_company
    return unless @block_bot.check_date(@bot.company.name) > 1

    flash[:notice] = 'Empresa bloqueada'
    @bot.company.update(blocked: true)
  end
end
