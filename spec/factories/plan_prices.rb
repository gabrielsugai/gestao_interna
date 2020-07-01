FactoryBot.define do
  factory :plan_price do
    plan
    value { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
