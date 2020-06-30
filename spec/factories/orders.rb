FactoryBot.define do
  factory :order do
    company { nil }
    plan { nil }
    price { 1.5 }
    email { "MyString" }
  end
end
