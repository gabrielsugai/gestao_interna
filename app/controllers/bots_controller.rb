class BotsController < ApplicationController
  def index
    @bots = Bot.all
  end
end