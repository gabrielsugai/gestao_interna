FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@test.com.br" }
    password { '1234567' }
  end
end
