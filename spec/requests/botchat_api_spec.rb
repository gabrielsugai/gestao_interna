require 'rails_helper'

describe 'Botchat tracking messages' do
  context 'POST /api/v1/bot_chat/start' do
    it 'should create a bot chat' do
      bot = create(:bot)
      current_time = Time.now.iso8601
      post api_v1_bot_chats_path,
           params: { bot: { token: bot.token },
                     bot_chat: { external_token: 'ABC123',
                                 platform: 'Facebook',
                                 start_time: current_time } }

      expect(response).to have_http_status(:ok)
      expect(bot.chats.count).to eq(1)
      expect(bot.chats.first.external_token).to eq('ABC123')
      expect(bot.chats.first.platform).to eq('Facebook')
      expect(bot.chats.first.start_time).to eq(current_time)
    end

    it 'should return not found for an invalid bot token' do
      current_time = Time.now.iso8601
      post api_v1_bot_chats_path,
           params: { bot: { token: "4D8F99" },
                     bot_chat: { external_token: 'ABC123',
                                 platform: 'Facebook',
                                 start_time: current_time } }

      expect(response).to have_http_status(:not_found)
    end

    it 'should return an unprocessable entity if external token is already used' do
      bot_chat = create(:bot_chat)
      current_time = Time.now.iso8601
      post api_v1_bot_chats_path,
           params: { bot: { token: bot_chat.bot.token },
                     bot_chat: { external_token: bot_chat.external_token,
                                 platform: 'Facebook',
                                 start_time: current_time } }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
