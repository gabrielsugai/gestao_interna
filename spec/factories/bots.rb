FactoryBot.define do
  factory :bot do
    company
    order
    status { 0 }
    token { 'MMM000' }
  end
end
