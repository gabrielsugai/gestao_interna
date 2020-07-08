FactoryBot.define do
  factory :bot_chat do
    bot
    start_time { Time.zone.now - 1.hour }
    platform { 'MyString' }
    external_token { Faker::Alphanumeric.unique.alphanumeric(number: 15) }

    trait :end_conversation do
      end_time { Time.zone.now + 1.hour }
      message_count { 1 }
    end
  end
end
