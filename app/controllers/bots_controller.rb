class BotsController < ApplicationController
  def index
    @bots = Bot.all
  end

  def show
    @bot = Bot.find(params[:id])
  end
  
  def block
    @bot = Bot.find(params[:bot_id])
    @bot.awaiting!
    redirect_to @bot
  end
  

end
