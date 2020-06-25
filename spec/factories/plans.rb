FactoryBot.define do
  factory :plan do
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    name { Faker::Lorem.word }
  end
end
