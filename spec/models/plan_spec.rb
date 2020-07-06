require 'rails_helper'

RSpec.describe Plan, type: :model do
  subject { create :plan }

  it 'has relations' do
    expect(subject).to have_many(:plan_prices)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'validates mandatory attributes' do
    expect(subject).to validate_presence_of(:name)
    expect(subject).to validate_presence_of(:price)
    expect(subject).to validate_presence_of(:platforms)
    expect(subject).to validate_presence_of(:limit_daily_chat)
    expect(subject).to validate_presence_of(:limit_monthly_chat)
    expect(subject).to validate_presence_of(:limit_daily_messages)
    expect(subject).to validate_presence_of(:limit_monthly_messages)
    expect(subject).to validate_presence_of(:extra_message_price)
    expect(subject).to validate_presence_of(:extra_chat_price)
  end

  it 'name must be unique' do
    subject.save
    new_plan = described_class.new(name: subject.name)

    expect(new_plan).not_to be_valid
    expect(new_plan.errors[:name]).to include('já está em uso')
  end

  it 'should create a plan_price before saving' do
    subject.price = '99.9'
    subject.save

    expect(subject.plan_prices.last).to eq(PlanPrice.last)
    expect(subject.plan_prices.last.value).to eq(PlanPrice.last.value)
  end

  it 'method: current_price' do
    create(:plan_price, value: 100.00, plan: subject)
    second_price = create(:plan_price, value: 200.00, plan: subject)

    expect(subject.current_price).to eq(second_price.value)
  end
end
