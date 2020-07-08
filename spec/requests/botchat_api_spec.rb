require 'rails_helper'

describe 'Botchat tracking messages' do
  context 'POST /api/v1/bot_chats' do
    it 'should create a bot chat' do
      bot = create(:bot)
      current_time = Time.now.iso8601
      post api_v1_bot_chats_path,
           params: { bot: { token: bot.token },
                     bot_chat: { external_token: 'ABC123',
                                 platform: 'Facebook',
                                 start_time: current_time } }

      expect(response).to have_http_status(:no_content)
      expect(bot.chats.count).to eq(1)
      expect(bot.chats.first.external_token).to eq('ABC123')
      expect(bot.chats.first.platform).to eq('Facebook')
      expect(bot.chats.first.start_time).to eq(current_time)
    end

    it 'should return not found for an invalid bot token' do
      current_time = Time.now.iso8601
      post api_v1_bot_chats_path,
           params: { bot: { token: '4D8F99' },
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

  context 'POST /api/v1/bot_chat/finish' do
    it 'should finish a conversation' do
      bot_chat = create(:bot_chat, start_time: Time.zone.now - 1.minute)
      current_time = Time.zone.now.iso8601

      post finish_api_v1_bot_chats_path,
           params: { bot_chat: { external_token: bot_chat.external_token,
                                 end_time: current_time,
                                 message_count: 42 } }

      bot_chat.reload
      expect(response).to have_http_status(:no_content)
      expect(bot_chat.end_time).to eq(current_time)
      expect(bot_chat.message_count).to eq(42)
    end

    it 'should return not found for an invalid external token' do
      current_time = Time.now.iso8601
      post finish_api_v1_bot_chats_path,
           params: { bot_chat: { external_token: 'dadadasdeaxcacada',
                                 end_time: current_time,
                                 message_count: 42 } }

      expect(response).to have_http_status(:not_found)
    end

    it 'should return unprocessable entity if end_time before start_time' do
      bot_chat = create(:bot_chat, start_time: Time.zone.now)
      bad_time = Time.zone.now - 1.minute

      post finish_api_v1_bot_chats_path,
           params: { bot_chat: { external_token: bot_chat.external_token,
                                 end_time: bad_time.iso8601,
                                 message_count: 42 } }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
