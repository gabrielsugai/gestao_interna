FactoryBot.define do
  factory :purchase_cancellation do
    purchase
    status { 0 }
    user { nil }
  end
end
