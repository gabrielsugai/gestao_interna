FactoryBot.define do
  factory :company do
    token { SecureRandom.alphanumeric(6).upcase }
    name { Faker::Company.name }
    cnpj { 'MyString' }
    address { Faker::Address.full_address }
    corporate_name { Faker::Company.name }
    blocked { false }
  end
end
