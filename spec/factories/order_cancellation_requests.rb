FactoryBot.define do
  factory :order_cancellation_request do
    order
    status { 0 }
    user { nil }
  end
end
