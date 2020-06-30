FactoryBot.define do
  factory :order_cancellation_request do
    order { nil }
    status { 1 }
    user { nil }
  end
end
