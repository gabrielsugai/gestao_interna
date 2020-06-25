FactoryBot.define do
  factory :company do
    token { SecureRandom.alphanumeric(6).upcase }
    name { Faker::Company.name }
    cnpj { 'MyString' }
    address { Faker::Address.full_address }
    blocked { false }
  end
end
