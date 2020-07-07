FactoryBot.define do
  factory :bot_chat do
    bot
    start_time { "2020-07-07 18:46:36" }
    end_time { "2020-07-07 18:46:36" }
    platform { "MyString" }
    external_token { Faker::Alphanumeric.unique.alphanumeric(number: 15) }
    message_count { 1 }
  end
end
