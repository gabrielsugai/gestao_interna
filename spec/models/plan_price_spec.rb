require 'rails_helper'

RSpec.describe PlanPrice, type: :model do
  let!(:subject) { create :plan_price }

  it 'has relations' do
    expect(subject).to respond_to(:plan)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
