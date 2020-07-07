class Api::V1::BotChatsController < Api::V1::ApiController
  def create
    bot = Bot.find_by!(token: params[:bot][:token])
    bot.chats.create!(bot_chat_params)

    render json: {}, status: :ok
  end

  private

  def bot_chat_params
    params.require(:bot_chat).permit(:external_token, :platform, :start_time)
  end
end
