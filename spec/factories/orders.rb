FactoryBot.define do
  factory :order do
    company
    plan
    price { 1.5 }
    email { 'company@test.com' }
  end
end
