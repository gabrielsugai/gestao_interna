class Api::V1::BotChatsController < Api::V1::ApiController
  def create
    bot = Bot.find_by!(token: params[:bot][:token])
    bot.chats.create!(create_bot_chat_params)

    render json: {}, status: :ok
  end

  def finish
    bot_chat = BotChat.find_by!(external_token: params[:bot_chat][:external_token])
    bot_chat.update!(finish_bot_chat_params)

    render json: {}, status: :ok
  end

  private

  def create_bot_chat_params
    params.require(:bot_chat).permit(:external_token, :platform, :start_time)
  end

  def finish_bot_chat_params
    params.require(:bot_chat).permit(:end_time, :message_count)
  end
end
