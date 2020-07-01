FactoryBot.define do
  factory :plan_price do
    plan
    value { Faker::Number.unique.decimal(l_digits: 3, r_digits: 2) }
  end
end
