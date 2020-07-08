require 'rails_helper'

RSpec.describe PlanPrice, type: :model do
  subject { create :plan_price }

  it 'has relations' do
    expect(subject).to belong_to(:plan)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'validates attributes' do
    expect(subject).to validate_presence_of(:value)
  end
end
