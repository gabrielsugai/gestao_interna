FactoryBot.define do
  factory :bot do
    company { nil }
    order { nil }
    status { 1 }
    token { "MyString" }
  end
end
