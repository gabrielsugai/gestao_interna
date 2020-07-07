FactoryBot.define do
  factory :bot do
    company
    purchase
    status { 0 }
    token { 'MMM000' }
  end
end
