FactoryBot.define do
  factory :purchase_cancellation do
    purchase
    status { 0 }
    user { nil }

    trait :with_a_reason do
      reason { Faker::Lorem.sentence }
    end
  end
end
