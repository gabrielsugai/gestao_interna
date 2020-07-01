FactoryBot.define do
  factory :bot do
    company
    order
    status { 0 }
    token { 'MyString' }
  end
end
