FactoryBot.define do
  factory :plan do
    price { 1.5 }
    name { 'MyString' }
    platforms { 'MyString' }
    limit_daily_chat { 1 }
    limit_monthly_chat { 1 }
    limit_daily_messages { 1 }
    limit_monthly_messages { 1 }
    extra_message_price { 1.5 }
    extra_chat_price { 1.5 }
  end
end
