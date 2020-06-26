FactoryBot.define do
  factory :company do
    token { SecureRandom.alphanumeric(6).upcase }
    name { Faker::Company.name }
    cnpj { Faker::Company.brazilian_company_number(formatted: true) }
    address { Faker::Address.full_address }
    corporate_name { Faker::Company.name }
    blocked { false }
  end
end
