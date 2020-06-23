FactoryBot.define do
  factory :company do
    token { "MyString" }
    name { "MyString" }
    cnpj { "MyString" }
    blocked { false }
  end
end
