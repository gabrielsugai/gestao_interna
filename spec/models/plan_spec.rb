require 'rails_helper'

RSpec.describe Plan, type: :model do
  let!(:subject) { create :plan }

  it 'has relations' do
    expect(subject).to respond_to(:plan_prices)
  end

  it 'should create a plan_price before saving' do
    subject.price = '99.9'
    subject.save

    expect(subject.plan_prices.last).to eq(PlanPrice.last)
    expect(subject.plan_prices.last.value).to eq(PlanPrice.last.value)
  end

  it 'method: current_price' do
    prices = create_list(:plan_price, 3, plan: subject)
    expect(subject.current_price).to eq(prices.last.value)
  end
end
